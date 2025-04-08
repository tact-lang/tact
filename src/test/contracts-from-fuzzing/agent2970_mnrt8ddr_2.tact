struct DeepNested {
    info: NestedInner;
}

struct NestedInner {
    flag: Bool;
    deeper: DeeperInner;
}

struct DeeperInner {
    number: Int;
    toggle: Bool;
}

contract TestContract {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            info: NestedInner{
                flag: true,
                deeper: DeeperInner{
                    number: 123,
                    toggle: false
                }
            }
        };
    }
}