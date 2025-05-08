struct DeepWrapLevel2 {
    i: Int;
}

struct DeepWrapLevel1 {
    l2: DeepWrapLevel2;
}

struct DeepWrapRoot {
    l1: DeepWrapLevel1;
}

contract WrappedThreeLevels {
    val: DeepWrapRoot;

    init() {
        self.val = DeepWrapRoot{
            l1: DeepWrapLevel1{
                l2: DeepWrapLevel2{
                    i: 99
                }
            }
        };
    }
}