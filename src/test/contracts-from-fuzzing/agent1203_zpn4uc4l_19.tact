struct NestedNested {
    i: Int;
}

struct OuterNested {
    nested: NestedNested;
}

contract NestedStructsState {
    outer: OuterNested;
    
    init() {
        self.outer = OuterNested{nested: NestedNested{i:1}};
    }
}