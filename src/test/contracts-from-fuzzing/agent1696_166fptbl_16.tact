struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Cell?;
    f: Address?;
}

contract LargeOptionalStructTest {
    val: ManyOptionals;

    init() {
        self.val = ManyOptionals{ a: null, b: null, c: null, d: null, e: null, f: null };
    }
}