// Large struct with many fields of differing types
struct LargeStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Slice;
    i: Address;
}

contract LargeStructTest {
    value: LargeStruct;

    init() {
        self.value = LargeStruct{
            a: 1,
            b: false,
            c: null,
            d: true,
            e: "abc",
            f: null,
            g: emptyCell(),
            h: emptyCell().asSlice(),
            i: myAddress()
        };
    }
}