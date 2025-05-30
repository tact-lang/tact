struct NestedOptional {
    x: Int?;
}

struct Wrapper {
    no: NestedOptional?;
}

contract OptionalInsideOptional {
    data: Wrapper;

    init() {
        self.data = Wrapper{ no: NestedOptional{ x: null } };
    }
}