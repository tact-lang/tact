struct Values {
    x: Int;
    y: Bool;
    z: String;
}

contract MixedDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "hello";
    d: Values = Values{x:0,y:false,z:""};

    init() {
        self.b = true;
    }
}