struct OptionalInner {
    foo: Int?;
    bar: Bool?;
}

contract OptionalInnerTest {
    val: OptionalInner;
    init() {
        self.val = OptionalInner{ foo:null, bar:null };
    }
}