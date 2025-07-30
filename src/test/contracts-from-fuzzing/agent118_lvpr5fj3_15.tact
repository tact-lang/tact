struct MixedFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Address;
    f: Address?;
    g: Cell;
    h: Cell?;
}

contract MixedTest {
    data: MixedFields;

    init() {
        self.data = MixedFields{
            a:1,
            b:true,
            c:null,
            d:null,
            e:myAddress(),
            f:null,
            g:emptyCell(),
            h:null
        };
    }
}