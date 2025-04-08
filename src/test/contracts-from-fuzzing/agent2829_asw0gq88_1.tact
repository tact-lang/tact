struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract TestStorage {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            a: null,
            b: true,
            c: null,
        };
    }
}
