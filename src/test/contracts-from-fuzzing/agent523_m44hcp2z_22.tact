struct S {
    a: Int;
    b: Int;
    c: Int;
}

contract DefaultStruct {
    s: S = S{ a:1, b:2, c:3 };

    init() {
        self.s = S{ a:10, b:20, c:30 };
    }
}
