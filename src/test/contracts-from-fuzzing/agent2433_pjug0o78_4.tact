struct DeepNested {
    outer: Middle;
}

struct Middle {
    mid: Inner;
}

struct Inner {
    val: Int;
}

contract DeepNestedContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            outer: Middle{
                mid: Inner{
                    val: 42
                }
            }
        };
    }
}