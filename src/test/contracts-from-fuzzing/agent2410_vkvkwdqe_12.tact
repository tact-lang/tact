struct Inner1 { x: Int; }
struct Inner2 { y: Bool; }

struct NestedMix {
    first: Inner1;
    second: Inner2;
    someNumber: Int;
}

contract MixedNestedTest {
    data: NestedMix;

    init() {
        self.data = NestedMix{
            first: Inner1{x: 5},
            second: Inner2{y: true},
            someNumber: 42,
        };
    }
}