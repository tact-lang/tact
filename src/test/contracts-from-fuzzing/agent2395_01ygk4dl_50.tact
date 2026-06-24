struct WithoutInit {
    a:Int;
    b:String;
    c:Bool;
}

contract MissingDefaults {
    f:WithoutInit;

    init() {
        self.f = WithoutInit{ a:1,b:"s",c:true };
    }
}
