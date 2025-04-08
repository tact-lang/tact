struct OptionalGroup {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract StructWithOptionals {
    data: OptionalGroup;

    init() {
        self.data = OptionalGroup{
            a: null,
            b: null,
            c: null
        };
    }
}