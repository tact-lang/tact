struct OptionalInner {
    a: Int?;
    b: Int?;
}

contract Test {
    val: OptionalInner;
    init() {
        self.val = OptionalInner{ a:null, b:null };
    }
}