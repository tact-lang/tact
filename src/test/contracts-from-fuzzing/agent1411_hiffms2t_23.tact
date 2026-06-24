// test persistent vars of mixed nested and optional types, large combo
struct DeepStruct {
    a: Int;
    b: Bool?;
    c: String;
    d: Cell?;
    e: Slice;
    f: Address?;
}

contract TestContract {
    f1: Int;
    f2: Bool?;
    f3: DeepStruct;
    f4: String?;

    init() {
        self.f1 = 12;
        self.f2 = null;
        self.f3 = DeepStruct{
            a: 34,
            b: false,
            c: "test",
            d: null,
            e: emptyCell().asSlice(),
            f: null
        };
        self.f4 = null;
    }
}