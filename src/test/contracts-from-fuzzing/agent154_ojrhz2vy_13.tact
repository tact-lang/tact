struct Inner1 { val: Int; }
struct Inner2 { i: Inner1; }
struct Inner3 { j: Inner2; }
struct Inner4 { k: Inner3; }
struct Inner5 { l: Inner4; }
struct Inner6 { m: Inner5; }

contract Chain6 {
    chainval: Inner6;

    init() {
        self.chainval = Inner6{ m: Inner5{ l: Inner4{ k: Inner3{ j: Inner2{ i: Inner1{ val:42 } } } } } };
    }
}