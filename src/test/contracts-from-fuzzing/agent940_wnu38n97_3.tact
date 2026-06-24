struct DeepNest3 {
    val: Int;
}

struct DeepNest2 {
    deep: DeepNest3;
    flag2: Bool;
}

struct DeepNest1 {
    deeper: DeepNest2;
    flag1: Bool;
}

contract TestContract {
    nested: DeepNest1;

    init() {
        self.nested = DeepNest1{
            deeper: DeepNest2{
                deep: DeepNest3{ val: 7 },
                flag2: false
            },
            flag1: true
        };
    }
}