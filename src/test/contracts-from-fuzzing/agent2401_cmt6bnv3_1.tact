struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract TestNestedOptionals {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            a: null,
            b: true,
            c: null,
        };
    }
}