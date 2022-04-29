Patterns

m.panelset = createObject("roSGNode", "PanelSet")
m.top.appendChild(m.panelset)
m.panelset.visible = false


m.listpanel = m.panelset.createChild("ListPanelExample")
'm.listpanel.list.content = m.readContentTask.content

m.panel = m.panelset.createChild("PanelExample") 'LOADS >> panel.xml >> <component name = "PanelExample" extends = "Panel">

'SELECT NAMED LAYOUT GROUP'
m.homeLayout = m.top.findNode("homeLayoutGroup")



'SELECT AND ALTER PRE ID'd NODE
m.infLabel = m.top.findNode("infoLabel")
m.infLabel.text = jzon.welcome_text

' FOR LOOP CREATE NODES FROM JSON ARRAY
m.counter = 0
for each item in jzon.faq
tag = createLabel(item, m.counter)
m.homeLayout.appendChild(tag)
m.counter = m.counter + 1
end for

'STRING COHERSION OF NUMBERS'
	thing = "book"
	color = "red"
	nuz = 1
	zz = Substitute("My {0} is {1} and {2}.", thing, color)
	m.authLabel.text = zz + nuz.ToStr()

'OBSERVE, SET FOCUS OF NODES: BUTTON GROUP'
m.hombe = m.top.findNode("homeGroup")
m.bob = m.top.findNode("bob")
m.bob.observeField("buttonSelected", "onButtonSelected")
m.bob.setFocus(true)

function onButtonSelected()
    if m.bob.buttonSelected = 0 then 
      xx = SetData("fox")
      m.authLabel.text = "button0 " + xx
    else if m.bob.buttonSelected = 1 then
      bb = GetData("UserRegistrationToken")
      cc = GetData("Username")
      m.authLabel.text = "button1" + bb + cc
    end if
end function

'FUNCTION TO CREATE AND RETURN LABEL OBJECT THAT ADDS ENUMERATOR'
function createLabel(obj as Object, couz as Integer) As Dynamic
  co = couz.ToStr()
  label = CreateObject("roSGNode", "Label")
  label.text = obj.title + co
  label.id = "infoLabel" + co
  label.height="0"
  'label.horizAlign="right"
  'label.translation="[0,0]"
  label.width="300"
  label.wrap = "true"
  return label
end function


'AUTH/GET FROM STORAGE SHIT'
m.authLabel = m.top.findNode("auth") 'GET NODE TO CHANGE FIRST'
qq = GetData("UserRegistrationToken")
ww = GetData("Username")
m.authLabel.text = qq + ww

'THESE ARE DATA STORAGE SET/GETTERS'
Function GetData( key as String) As Dynamic
	sec = CreateObject("roRegistrySection", "Authentication")
	if sec.Exists(key)
		return sec.Read(key)
	endif
	return "invalid"
End Function

Function SetData(userToken As String)
	sec = CreateObject("roRegistrySection", "Authentication")
	sec.Write("UserRegistrationToken", userToken)
	sec.Write("Username", "wonder")
	sec.Flush() 'THIS LINE IS WHAT SAVES VALUES'
	return "set " + userToken
End Function


For Each moment In guide.venues[venue].moments
  For Each media In guide.venues[venue].moments[moment].media
    if media.type = "image"
      'WHAT DO WITH IMAGES'
    else if media.type = "video"
      vid = createObject("RoSGNode", "ContentNode")
      vid.url = media.url
      vid.title = "Test Video"
      videoContent.appendChild(vid)
    end if
  End For
End For