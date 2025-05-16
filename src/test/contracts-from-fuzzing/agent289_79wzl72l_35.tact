struct DeepNestedBool {
    f1: Bool;
    f2: Bool;
}

struct OuterBoolContainer {
    container: DeepNestedBool;
    flag: Bool;
}

contract NestedBoolTest {
    val: OuterBoolContainer;

    init() {
        self.val = OuterBoolContainer{
            container: DeepNestedBool{
                f1: true,
                f2: false
            },
            flag: true
        };
    }
}