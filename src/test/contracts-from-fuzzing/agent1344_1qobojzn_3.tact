struct ManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
}

contract OptionalTest {
    data: ManyOptional;

    init() {
        self.data = ManyOptional{a: null, b: null, c: null, d: null};
    }
}
