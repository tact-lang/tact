struct NoDefaults {
    a: Int;
    b: String;
    c: Bool;
}

contract ZeroInit {
    data: NoDefaults;

    init() {
        self.data = NoDefaults{a:0,b:"",c:false};
    }
}
