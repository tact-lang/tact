struct SimpleStruct { a: Int; b: Bool; c: String; d: Cell; e: Slice; f: Builder; g: Address; h: Int?; i: Bool?; j: String?; k: Cell?; l: Slice?; m: Builder?; n: Address?; }

contract WideFieldsTest {
    field: SimpleStruct;
    init() {
        self.field = SimpleStruct{
            a: 42, b: true, c: "abc", d: emptyCell(), e: emptyCell().asSlice(), f: beginCell(), g: myAddress(),
            h: null, i: null, j: null, k: null, l: null, m: null, n: null,
        };
    }
}