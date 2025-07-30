struct S {
    a: Int;
    b: Bool;
    c: String?;
}
contract MultipleDefaults {
    s: S = S { a:0, b:false, c:null };

    init() {
        self.s = S { a:5, b:true, c:null };
    }
}