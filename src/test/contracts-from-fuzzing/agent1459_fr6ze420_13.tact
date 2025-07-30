// Large struct used as persistent storage var
struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
    i: Int as uint32;
    j: Int as int16;
    k: Int as uint8;
}

contract LargeStructVar {
    val: LargeStruct;

    init() {
        self.val = LargeStruct{
            a: 1,
            b: false,
            c: "x",
            d: myAddress(),
            e: null,
            f: true,
            g: "y",
            h: null,
            i: 123456,
            j: -1234,
            k: 255
        };
    }
}