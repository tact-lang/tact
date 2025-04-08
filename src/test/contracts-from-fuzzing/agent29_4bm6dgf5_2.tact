struct MultiNested {
    inner1: Int;
    inner2: Inner; 
}

struct Inner {
    val: Int;
}

contract MultiStructTest {
    nestedStruct: MultiNested;

    init() {
        self.nestedStruct = MultiNested{
            inner1: 10,
            inner2: Inner{val: 20},
        };
    }
}