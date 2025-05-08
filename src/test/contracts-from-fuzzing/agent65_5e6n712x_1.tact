struct DeepNested {
    child: NestedLevel1;
}

struct NestedLevel1 {
    child: NestedLevel2;
}

struct NestedLevel2 {
    child: NestedLevel3;
}

struct NestedLevel3 {
    child: NestedLevel4;
}

struct NestedLevel4 {
    value: Int;
}

contract TestContract {
    deepData: DeepNested;

    init() {
        self.deepData = DeepNested{
            child: NestedLevel1{
                child: NestedLevel2{
                    child: NestedLevel3{
                        child: NestedLevel4{
                            value: 42
                        }
                    }
                }
            }
        };
    }
}
