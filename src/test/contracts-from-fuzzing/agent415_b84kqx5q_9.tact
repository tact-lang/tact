struct DeeplyNestedOptional {
    value: Int?;
}

struct Wrapper {
    nested: DeeplyNestedOptional?; // optional nested struct
}

contract NestedOptionals {
    data: Wrapper;

    init() {
        self.data = Wrapper{nested: null};
    }
}