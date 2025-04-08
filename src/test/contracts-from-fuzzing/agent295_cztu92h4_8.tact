// Large struct with many optional fields of various primitive types
struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract OptionalVarietyTest {
    data: ManyOptionals = ManyOptionals{
        a: null,
        b: null,
        c: null,
        d: null,
        e: null,
        f: null,
    };

    init() {
        self.data = ManyOptionals{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "test",
        };
    }

    receive() {
        self.data = self.data;
    }
}