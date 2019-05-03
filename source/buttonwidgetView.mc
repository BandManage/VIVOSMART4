using Toybox.WatchUi;
using Toybox.Communications;


class buttonwidgetView extends WatchUi.View {
	var width;
	var height;

    function initialize() {
        View.initialize();
        System.println("boot");
    }

    // Load your resources here
    function onLayout(dc) {
    	width = dc.getWidth();
    	height = dc.getHeight();
        setLayout(Rez.Layouts.MainLayout(dc));
        var b_zout = {
            :locX => width/4,
            :locY => height/4,
            :width => width/2,
            :height => height/2,
            :stateDefault => Graphics.COLOR_ORANGE,
            :stateHighlighted => Graphics.COLOR_YELLOW,
            :stateSelected => Graphics.COLOR_BLUE,
            :stateDisabled => Graphics.COLOR_ORANGE,
            :background => Graphics.COLOR_WHITE,
            :behavior => :btnClick
        };

        var tsButton = new WatchUi.Button(b_zout);

        setLayout([ tsButton ]);
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}


class MyBehaviorDelegate extends WatchUi.BehaviorDelegate {
    var view;
    var enter;
    
    function initialize(v, e) {
        BehaviorDelegate.initialize();
        view = v;
        enter = e;
        System.println("view boot");
    }
    
    function btnClick() {
        System.println("btn clicked");
        //comm.registerForPhoneAppMessages();
		var listener = new Communications.ConnectionListener();
		var content = { "message" => "notification" };
		Communications.transmit( content, null, listener );
        return true;
    }

    
//	function onTap(evt) {
//        System.println("touch");
//
////		WatchUi.pushView(view, new MyBehaviorDelegate(view, true), WatchUi.SLIDE_IMMEDIATE);
//	    var xy=evt.getCoordinates();
//		if((xy[0]> (view.width*0.25) && xy[0]<(view.width*(0.75))) && (xy[1]>(view.height*0.25) && xy[1]<(view.height*0.75))) {
//	              // do what you need to do here					}
//	        System.println("1");
//		}
//	}
}




