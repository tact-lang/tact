struct HugeStruct {
    a: Int; b: Bool; c: String; d: Int?; e: Bool?; f: String?; g: Address; h: Address?;
    i: Cell; j: Cell?; k: Slice; l: Slice?; m: Builder; n: Builder?; o: Int;
}

contract HugeStructTest {
    field: HugeStruct;
    init() {
        self.field = HugeStruct{
            a: 1, b: true, c: "x", d: null, e: false, f: null, g: myAddress(), h: null,
            i: emptyCell(), j: null, k: emptyCell().asSlice(), l: null, m: beginCell(), n: null, o: 42
        };
    }
}