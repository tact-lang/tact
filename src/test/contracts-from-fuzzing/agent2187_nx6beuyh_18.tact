struct NestedBool {
    b: Bool;
}

struct DeepNest {
    n1: NestedBool;
    n2: NestedBool;
    n3: NestedBool;
}

contract BoolNesting {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            n1: NestedBool{b:true},
            n2: NestedBool{b:false},
            n3: NestedBool{b:true}
        };
    }
}