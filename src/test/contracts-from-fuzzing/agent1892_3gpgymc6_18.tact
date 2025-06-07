struct NestedStringOpt {
    s: String?;
}

struct Wrapper {
    nested: NestedStringOpt;
}

contract NestedOptStr {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            nested: NestedStringOpt{ s: null }
        };
    }
}