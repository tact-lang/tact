struct One {
    a: Int;
}

struct Two {
    a: Int;
    b: Bool;
}

struct Three {
    a: Int;
    b: Bool;
    c: String;
}

contract MixedNesting {
    x: One;
    y: Two;
    z: Three;

    init() {
        self.x = One{a:1};
        self.y = Two{a:2, b:false};
        self.z = Three{a:3, b:true, c:"hi"};
    }
}