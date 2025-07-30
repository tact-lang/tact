struct NestedOptional {
    inner: Int?;
    text: String?;
    flag: Bool?;
}

contract Opts {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            inner: null,
            text: null,
            flag: null
        };
    }
}