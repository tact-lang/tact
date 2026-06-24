struct InnerS {
    b: Bool;
}

struct OuterS {
    foo: Int;
    inner: InnerS;
}

contract StructFieldAccessTest {
    state: OuterS;

    init() {
        self.state = OuterS{
            foo: 7,
            inner: InnerS{b:false}
        };
    }
}