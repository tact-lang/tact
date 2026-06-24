struct ComplexDefaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
    g: Cell;
    h: Slice;
}

contract CDTest {
    val: ComplexDefaults;

    init() {
        self.val = ComplexDefaults{
            g: emptyCell(),
            h: emptyCell().asSlice()
        };
    }
}