struct S {
    a: Int;
    b: String;
    c: Bool;
}

contract Defaults {
    f: S;
    x: Int = 5;
    y: String = "hi";
    z: Bool = false;

    init() {
        self.f = S {
            a: 1,
            b: "t",
            c: true
        };
    }
}