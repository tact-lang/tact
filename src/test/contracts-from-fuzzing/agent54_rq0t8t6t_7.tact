struct OneBigStruct {
    a: Int; b: Bool; c: String; d: Cell; e: Slice; f: Address;
    g: Int?; h: Bool?; i: String?; j: Cell?; k: Slice?; l: Address?;
}

contract CombinedFieldsTest {
    myData: OneBigStruct;

    init() {
        self.myData = OneBigStruct{
            a: 5, b: true, c: "hey", d: emptyCell(), e: emptyCell().asSlice(), f: myAddress(),
            g: null, h: false, i: null, j: emptyCell(), k: null, l: null
        };
    }
}