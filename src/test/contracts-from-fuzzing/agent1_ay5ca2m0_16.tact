struct CombinedNested {
    s1: Inner1;
    optInner: Inner2?;
}

struct Inner1 {
    x: Int;
    y: Bool;
}

struct Inner2 {
    s: String;
    addr: Address;
}

contract CombineTest {
    data: CombinedNested;

    init() {
        self.data = CombinedNested{
            s1: Inner1 { x: 7, y: true },
            optInner: null
        };
    }
}
