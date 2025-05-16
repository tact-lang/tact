// Large struct with lots of optional fields of primitive types
struct LotsOfOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
}

contract TestContract {
    value: LotsOfOptionals;
    init() {
        self.value = LotsOfOptionals{
            a: 1,
            b: null,
            c: "abc",
            d: myAddress(),
            e: null,
            f: emptyCell().asSlice(),
            g: null,
            h: true,
            i: null,
            j: myAddress()
        };
    }
}