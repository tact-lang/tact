struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract DefaultsMix {
    x: Int = 1;
    y: Bool;
    z: String;
    s: S = S{a:2,b:true,c:"hi"};

    init() {
        self.y = false;
        self.z = "ok";
    }
}