struct S {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: String;
    f6: String;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{
            f1: 1,
            f2: false,
            f3: null,
            f4: true,
            f5: "test",
            f6: "more",
        };
    }
}