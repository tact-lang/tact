struct BigStruct {
    a: Int;  b: Bool;  c: Slice; d: String; e: Address;
    f: Cell; g: Int?;  h: Bool?;  i: String?;  j: Address?;
}

contract StructBigFields {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1,
            b: false,
            c: emptyCell().asSlice(),
            d: "hello",
            e: myAddress(),
            f: emptyCell(),
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}