struct NestedOptional {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
}

contract Test {
    data: NestedOptional = NestedOptional{
        opt1: null,
        opt2: true,
        opt3: null
    };
    init() {}
}