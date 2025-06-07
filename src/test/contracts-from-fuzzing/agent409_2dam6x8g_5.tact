struct Complex {
    int1: Int;
    int2: Int as int64;
    bool1: Bool;
    str1: String;
    str2: String;
    opt1: Int?;
    opt2: Bool?;
    cell1: Cell;
    slice1: Slice;
    builder1: Builder;
}

contract Variety {
    data: Complex;

    init() {
        self.data = Complex{
            int1: 100,
            int2: 64,
            bool1: true,
            str1: "test",
            str2: "",
            opt1: null,
            opt2: false,
            cell1: emptyCell(),
            slice1: emptyCell().asSlice(),
            builder1: beginCell(),
        };
    }
}