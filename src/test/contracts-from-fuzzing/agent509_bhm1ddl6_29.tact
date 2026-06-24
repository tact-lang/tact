struct MegaStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell?;
    h: Slice?;
    i: Bool;
    j: Int;
}

contract MegaTest {
    val: MegaStruct;

    init() {
        self.val = MegaStruct{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: "hello",
            f: null,
            g: emptyCell(),
            h: emptyCell().asSlice(),
            i: false,
            j: 999
        };
    }
}