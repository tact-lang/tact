struct C1 {
    val: Int;
    nested: C2;
}

struct C2 {
    val: Int;
    nested: C3;
}

struct C3 {
    val: Int;
}

contract ChainNestedTest {
    chain: C1;
    init() {
        self.chain = C1{val:1, nested:C2{val:2, nested:C3{val:3}}};
    }
}