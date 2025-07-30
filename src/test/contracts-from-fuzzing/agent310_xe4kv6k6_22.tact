struct StructA {
    x: Int;
}

struct StructB {
    y: StructA?;
}

contract CrossOptionalStructTest {
    val: StructB;

    init() {
        self.val = StructB{y: null};
    }
}