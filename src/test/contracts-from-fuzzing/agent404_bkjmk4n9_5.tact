struct S {
    x: Int;
    y: Bool;
    z: String;
    opt: Int?;
}

contract TestContract {
    s: S;
    init() {
        self.s = S{
            x: 10,
            y: true,
            z: "hi",
            opt: null,
        };
    }
}