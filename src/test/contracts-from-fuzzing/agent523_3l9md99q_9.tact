struct Inner1 { x: Int; y: Bool; }
struct Inner2 { p: Int; q: Bool; }

struct DoubleNested {
    first: Inner1;
    second: Inner2;
}

contract DoubleNestedContract {
    d: DoubleNested;
    init() {
        self.d = DoubleNested{
            first: Inner1{x: 1, y: false},
            second: Inner2{p: 2,q:true}
        };
    }
}