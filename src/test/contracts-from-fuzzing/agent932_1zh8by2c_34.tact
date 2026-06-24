// test a flat struct with >20 optional primitive fields
struct LotsOfOptionals {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Bool?; g: Bool?; h: Bool?; i: Bool?; j: Bool?;
    k: Address?; l: Address?; m: Address?; n: Address?; o: Address?;
    p: String?; q: String?; r: String?; s: String?; t: String?;
}

contract ManyOptionalsFlat {
    data: LotsOfOptionals;

    init() {
        self.data = LotsOfOptionals{
            a:null, b:1, c:null, d:2, e:null,
            f:true, g:null, h:false, i:null, j:true,
            k:null, l:null, m:null, n:null, o:null,
            p:null, q:"a", r:null, s:"b", t:null
        };
    }
}