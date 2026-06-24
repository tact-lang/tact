struct InA {
    val: Int;
}

struct InB {
    sub: InA;
}

contract DeepSet {
    outer: InB;

    init() {
        self.outer = InB{sub: InA{val:5}};
        self.outer = InB{sub: InA{val:10}};
    }
}