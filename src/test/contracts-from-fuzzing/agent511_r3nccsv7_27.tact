struct DoubleNested {
    one: Inner;
    two: Inner;
}

struct Inner {
    foo: Int;
    bar: Bool?;
}

contract DoubleNestedContract {
    val: DoubleNested;

    init() {
        self.val = DoubleNested{
            one: Inner{ foo:7, bar:true },
            two: Inner{ foo:8, bar:null }
        };
    }
}