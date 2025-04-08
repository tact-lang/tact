struct InnerA {
    val: Int;
}
struct InnerB {
    val: Bool;
}

struct Outer {
    a: InnerA;
    b: InnerB;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            a: InnerA{val:5},
            b: InnerB{val:true},
        };
    }
}