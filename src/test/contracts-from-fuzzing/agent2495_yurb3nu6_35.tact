struct BigFlat {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: String?;
    g: Bool;
    h: Address?;
    i: Int;
}

contract BigFlatStorage {
    f: BigFlat;

    init() {
        self.f = BigFlat{
            a:1, b:true, c:"hi", d:myAddress(),
            e:null, f:null, g:false, h:null, i:99
        };
    }
}