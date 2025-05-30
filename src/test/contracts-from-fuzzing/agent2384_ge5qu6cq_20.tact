struct S {
    a: Int;
    b: Bool;
}

contract MixedInit {
    x: Int;
    y: S;

    init() {
        self.x = 12;
        self.y = S{a:5,b:true};
    }
}