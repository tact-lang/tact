struct DeepNested {
    inner: InnerLevel1;
}

struct InnerLevel1 {
    level2: InnerLevel2?; // optional nested struct
}

struct InnerLevel2 {
    val: Int;
}

contract TestContract {
    nestedState: DeepNested;

    init() {
        self.nestedState = DeepNested{
            inner: InnerLevel1{
                level2: InnerLevel2{
                    val: 123
                }
            }
        };
    }
}
