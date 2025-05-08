struct S {
    a: Int;
    b: String;
    c: Bool;
}

contract ManyStructs {
    x: S;
    y: S;
    z: S;

    init() {
        self.x = S{a:1,b:"x",c:true};
        self.y = S{a:2,b:"y",c:false};
        self.z = S{a:3,b:"z",c:true};
    }
}
