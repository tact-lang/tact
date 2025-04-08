struct NestedOptional {
    opt1: Int?;
    opt2: NestedInOptional?;
}

struct NestedInOptional {
    val: Int;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            opt1: null,
            opt2: null
        };
    }
}
