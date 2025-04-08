struct NestedOptional {
    val: Int?;
    sub: SubNested?;
}

struct SubNested {
    flag: Bool;
    text: String?;
}

contract OptsInOpts {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            val: null,
            sub: null,
        };
    }
}