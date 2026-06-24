struct S {
    s: String;
}

contract DefaultOptMix {
    a: String = "test";
    b: String?;
    sField: S;

    init() {
        self.b = null;
        self.sField = S { s: "hi" };
    }

    receive() {}
}