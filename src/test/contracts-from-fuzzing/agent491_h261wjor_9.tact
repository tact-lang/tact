struct Inner {
    val1: Int;
    val2: Bool;
    val3: Address;
    val4: Cell;
}

struct Outer {
    inner: Inner;
    opt: String?;
    flag: Bool;
}

contract NestedAdvanced {
    state: Outer;
    init() {
        self.state = Outer{
            inner: Inner{
                val1: 42,
                val2: true,
                val3: myAddress(),
                val4: emptyCell(),
            },
            opt: null,
            flag: false,
        };
    }
}