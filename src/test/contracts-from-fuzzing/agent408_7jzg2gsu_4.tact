struct NestedOptional {
    inner: Int?;
    flag: Bool;
}

struct OuterStruct {
    id: Int;
    data: NestedOptional?;
}

contract DeepOpt {
    state: OuterStruct;

    init() {
        self.state = OuterStruct { id: 123, data: null };
    }
}