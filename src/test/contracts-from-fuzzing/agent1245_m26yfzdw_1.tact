struct NestedOptional {
    val1: Int?;
    val2: Bool?;
    child: ChildStruct?;
}

struct ChildStruct {
    x: Int;
    y: String?;
}

contract TestContract {
    ns: NestedOptional;

    init() {
        self.ns = NestedOptional{
            val1: null,
            val2: true,
            child: ChildStruct{
                x: 1,
                y: null,
            },
        };
    }
}
