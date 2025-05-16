struct MultipleNestedOptionals {
    a: Int?;
    b: String?;
    c: Address?;
    d: Slice?;
}

struct HasMultiOpt {
    one: MultipleNestedOptionals?;
    two: MultipleNestedOptionals?;
}

contract NestedMultiOpt {
    val: HasMultiOpt;

    init() {
        self.val = HasMultiOpt{one:null,two:null};
    }
}