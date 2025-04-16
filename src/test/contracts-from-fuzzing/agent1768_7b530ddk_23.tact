struct NestedOptionalStructs {
    innerOpt: Inner1?;
}

struct Inner1 {
    inner2: Inner2?;
}

struct Inner2 {
    value: Int?;
}

contract TestStorage {
    data: NestedOptionalStructs;

    init() {
        self.data = NestedOptionalStructs{
            innerOpt: null
        };
    }
}