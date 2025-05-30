struct Mix {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    iopt: Int?;
    bopt: Bool?;
    sopt: String?;
    aopt: Address?;
}

contract MixStructs {
    field: Mix;

    init() {
        self.field = Mix{
            i: 1, b: false, s: "test", a: myAddress(), c: emptyCell(), sl: emptyCell().asSlice(),
            iopt: null, bopt: null, sopt: null, aopt:null,
        };
    }
}