struct NestedOptional {
    child: Int?;
}

struct Wrapper {
    nested: NestedOptional?;
}

contract OptionalNestedStruct {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            nested: null,
        };
    }
}