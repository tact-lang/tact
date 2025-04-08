struct S {
    a:String;
    b:String?;
}

contract Test {
    field: S;

    init() {
        self.field = S{ a: "abc", b: null };
    }
}