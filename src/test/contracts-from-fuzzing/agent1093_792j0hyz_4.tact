struct DeepNested {
    inner1: Inner1;
}

struct Inner1 {
    inner2: Inner2;
}

struct Inner2 {
    val: Int;
}

contract DeepStructTest {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            inner1: Inner1{
                inner2: Inner2{
                    val: 99
                }
            }
        };
    }
}