struct OptMany {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptsInStructMany {
    foo: OptMany;

    init() {
        self.foo = OptMany{
            a: null,
            b: true,
            c: "Test"
        };
    }
}