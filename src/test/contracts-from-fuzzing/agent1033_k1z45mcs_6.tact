struct NestedOptional {
    inner: Int?;
    label: String;
}

struct OuterOptional {
    data: NestedOptional?;
    flag: Bool?;
}

contract ComplexOptional {
    content: OuterOptional;

    init() {
        self.content = OuterOptional{
            data: null,
            flag: true
        };
    }
}