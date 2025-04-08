struct Mixed {
    a: Int = 1;
    b: Int? = null;
    c: Bool = true;
    d: Bool? = null;
    e: String = "hi";
    f: String? = null;
    g: Address? = null;
    h: Slice? = null;
    i: Cell? = null;
    j: Int = 0;
}

contract TestContract {
    mixed: Mixed = Mixed{};

    init() {
        self.mixed = Mixed{
            a: 10,
            b: 20,
            c: false,
            d: true,
            e: "hello",
            f: "world",
            g: null,
            h: null,
            i: null,
            j: 99
        };
    }
}
