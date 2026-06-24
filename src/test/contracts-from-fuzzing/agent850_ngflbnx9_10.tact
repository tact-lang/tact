struct SDeep {
    x: Int;
    y: Int;
    z: Int;
}

contract DeepInit {
    a: SDeep;
    b: SDeep;
    c: SDeep;

    init() {
        self.a = SDeep{x:1,y:2,z:3};
        self.b = SDeep{x:4,y:5,z:6};
        self.c = SDeep{x:7,y:8,z:9};
    }
}
