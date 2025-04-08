struct NestedOptional {
    val: Int?;
    flag: Bool?;
}

struct OuterOptional {
    nest: NestedOptional?;
}

contract OptionalContainer {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            nest: null
        };
    }
}