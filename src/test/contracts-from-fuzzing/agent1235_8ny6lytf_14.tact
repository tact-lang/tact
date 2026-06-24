struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract DefaultsInStruct {
    s: S = S{ a:0, b:false, c:"hello" };

    init() {
        self.s = S{ a: 999, b: true, c: "world" };
    }
}