struct InnerNested {
    val: Int?;
}

struct NestedStruct {
    inners: InnerNested;
}

struct Container {
    nested: NestedStruct;
}

contract NestedFieldChain {
    c: Container;

    init() {
        self.c = Container{
            nested: NestedStruct{
                inners: InnerNested{ val: null }
            }
        };
    }
}