struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract MultiTypeStruct {
    s: S;

    init() {
        self.s = S{ a:7, b:true, c:"hi" };
    }
}