struct AllTypes {
    i: Int;
    iopt: Int?;
    b: Bool;
    bopt: Bool?;
    s: String;
    sopt: String?;
    c: Cell;
    sl: Slice;
    bu: Builder;
    a: Address;
}

contract AllTest {
    data: AllTypes;

    init() {
        self.data = AllTypes {
            i:1, iopt:null,
            b:true, bopt:null,
            s:"hi", sopt:null,
            c:emptyCell(), sl:emptyCell().asSlice(),
            bu:beginCell(), a:myAddress()
        };
    }
}