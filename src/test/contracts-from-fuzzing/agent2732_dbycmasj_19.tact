struct Mix {
    i: Int;
    io: Int?;
    b: Bool;
    bo: Bool?;
    s: String;
    so: String?;
    a: Address;
    ao: Address?;
    c: Cell;
    co: Cell?;
    sl: Slice;
    slo: Slice?;
}

contract MixedFields {
    data: Mix;

    init() {
        self.data = Mix{
            i:1, io:null,
            b:true, bo:null,
            s:"x", so:null,
            a:myAddress(), ao:null,
            c:emptyCell(), co:null,
            sl:emptyCell().asSlice(), slo:null,
        };
    }
}