Pulled out

sub showpanelinfo()
  panelcontent = m.listpanel.list.content.getChild(m.listpanel.list.itemFocused)

  m.panel.description = panelcontent.description

  m.gridpanel = createObject("roSGNode", "GridPanelExample")
  m.gridpanel.gridcontenturi = panelcontent.url
end sub

sub slidepanels()
  if not m.panelset.isGoingBack
    m.panelset.appendChild(m.gridpanel)
    m.gridpanel.setFocus(true)
  else
    m.listpanel.setFocus(true)
  end if 
end sub



'Pulled from sub INIT'
  m.panelset = createObject("roSGNode", "PanelSet")
  m.top.appendChild(m.panelset)
  m.panelset.visible = false

  'm.readContentTask = createObject("roSGNode", "ContentReader")
  'm.readContentTask.observeField("content", "setpanels")
  'm.readContentTask.contenturi = "http://www.sdktestinglab.com/Tutorial/content/panelsetcontent.xml"
  'm.readContentTask.control = "RUN"

  m.listpanel = m.panelset.createChild("ListPanelExample")
  'm.listpanel.list.content = m.readContentTask.content

  m.panel = m.panelset.createChild("PanelExample")

  m.listpanel.list.observeField("itemFocused", "showpanelinfo")
  m.panel.observeField("focusedChild", "slidepanels")


  <Group id="homeScreen">
      <LayoutGroup id="home_welcome_text">
          <Label/> <Poster=user_image />
      </LayoutGroup>
      <LayoutGroup id="hometext">
      </LayoutGroup>
      <LayoutGroup>
        <ButtonGroup>
          <Button/>
          <Button/>
        </ButtonGroup>
      </LayoutGroup>
    </Group>

    <Group id="faqScreen">
      iterator = 0
      loop over sections >
        add button > visible id0
        add text area > hidden id0
      end 
      onKeyEvent
      if down
        what focus.id
        focus(focus.id + 0)
      end
      <LayoutGroup id="faq_welcome_text">
          <Label /><Poster=user_image />
      </LayoutGroup>
      <LayoutGroup id="faqtextitems">
        <Label id=title01>
        <Label id=body01> 
      </LayoutGroup>
    </Group>
    
    <Group id="guides">
      <LayoutGroup id="guide_welcome_text">
          <Label/><Poster=user_image />
      </LayoutGroup>
      <LayoutGroup id="hometext">
      </LayoutGroup>
      <LayoutGroup id=guidegrid>
        <Poster></Poster>  <Poster></Poster>
        <Poster></Poster>  <Poster></Poster>
        <Poster></Poster>  <Poster></Poster>
      </LayoutGroup>
      <LayoutGroup id=guidepreview>
        <Poster>
        </Poster>
        function rotateImageEveryN
        end
      </LayoutGroup>
    </Group>
    'ABOVE HERE IS IN PROGRESS'
    
    'BELOW HERE IS WORKING'
    '<Group id="guideDetails">
    '  <LayoutGroup id="detail header">
    '  </LayoutGroup>
    '  <LayoutGroup id=guidegrid>
    '    <Poster id=01>resteraount</Poster>
    '    <Poster id=02>resteraount</Poster>
    '    <Poster id=03>resteraount</Poster>
    '  </LayoutGroup>
    '  counter = 0
    '  loop resteraunt for 
    '    add Poster.id = "post" + counter
    '    add listener(counter) on focus delete and render new guidepreviewRender
    '    counter ++
    '  end
    '  function guidePreviewRender
    '    get focus id, 
    '    localVar = get tag with venueMedia + focus id
    '    localVar/venueMedia.image = item 01
    '  end
    '  <LayoutGroup id=guidepreview>
    '    <Poster id=venueMedia>
    '    </Poster>
    '    function rotateImageEveryN
    '    end
    '  </LayoutGroup>
    '</Group>  

    <Group
      id="homeGroup"
      visible="true">
      <LayoutGroup
        id="homeLayoutGroup"
        translation="[215,69]">
        <ButtonGroup
          id="bob"
          layoutDirection="horiz">
          <Button
            focusedIconUri=""
            iconUri=""
            text="ALL THE THINGS"/>
          <Button
            focusedIconUri=""
            iconUri=""
            text="YOU SHOULD KNOW"/>
        </ButtonGroup>
        <Label
          id = "infoLabel" 
          height="0"
          horizAlign="right"
          text="hello there, welcome!"
          translation="[0,0]"
          width="522"
          wrap = "true" />
        <Label
          id = "auth" 
          height="0"
          horizAlign="right"
          text="z"
          translation="[0,0]"
          width="522"
          wrap = "true" />          
      </LayoutGroup>
    </Group>