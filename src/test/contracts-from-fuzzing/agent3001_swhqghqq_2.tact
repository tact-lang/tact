struct NestedLevel2 {
    deepVal: Int;
}

struct NestedLevel1 {
    nested: NestedLevel2;
    optNested: NestedLevel2?;
}

contract NestedContract {
    state: NestedLevel1;

    init() {
        self.state = NestedLevel1{
            nested: NestedLevel2{ deepVal: 42 },
            optNested: null
        };
    }
}
