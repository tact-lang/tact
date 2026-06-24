struct Deep {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Cell;
    k: Address;
}

contract ManyFields {
    payload: Deep;
    init() {
        self.payload = Deep{
            a:1,
            b:true,
            c:"abc",
            d:emptyCell(),
            e:emptyCell().asSlice(),
            f: myAddress(),
            g:null,
            h:false,
            i:"xyz",
            j:emptyCell(),
            k: myAddress()
        };
    }
}