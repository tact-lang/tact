struct ManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "s";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
    g: Address? = null;
    h: Cell;
    i: Slice;
    j: Slice? = null;
}

contract DefTest {
    data: ManyDefaults;

    init() {
        self.data = ManyDefaults{
            a: 5,
            b: true,
            c: "hi",
            d: 6,
            e: true,
            f: "x",
            g: myAddress(),
            h: beginCell().endCell(),
            i: beginCell().endCell().asSlice(),
            j: null
        };
    }
}