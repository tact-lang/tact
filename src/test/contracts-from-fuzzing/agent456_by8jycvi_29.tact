struct NestedOptionalStruct {
    sub: SubStruct?;
}

struct SubStruct {
    val: Int;
}

contract NestedOptStructContract {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct {
            sub: null
        };
    }
}