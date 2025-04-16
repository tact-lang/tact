struct S {
    a: Int;
    b: String;
}
contract OptStruct {
    val: S?;

    init() {
        self.val = S{ a:1, b:"hi" };
    }
}