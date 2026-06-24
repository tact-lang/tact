struct NestedOptional {
    x: Int?;
    y: Bool?;
    s: String?;
    c: Cell?;
    a: Address?;
}

contract OptContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            x: null,
            y: null,
            s: null,
            c: null,
            a: null,
        };
    }
}