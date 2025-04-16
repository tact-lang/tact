struct Core {
    a:Int;
    b:Bool;
    c:String;
}

contract ManyOptionalsOfStruct {
    x1:Core?;
    x2:Core?;
    x3:Core?;
    x4:Core?;

    init() {
        self.x1 = null; self.x2=null; self.x3=null; self.x4=null;
    }
}
