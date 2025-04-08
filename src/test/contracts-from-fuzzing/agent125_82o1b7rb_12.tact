struct ManyOptionals {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Bool?; g: Bool?; h: Bool?; i: Bool?; j: Bool?;
    k: Address?; l: Address?; m: Address?; n: Address?; o: Address?;
    p: String?; q: String?; r: String?; s: String?; t: String?;
    u: Cell?; v: Cell?; w: Cell?; x: Cell?; y: Cell?; z: Cell?;
}

contract TestContract {
    storage: ManyOptionals;
    init() {
        self.storage = ManyOptionals{
            a:null, b:null, c:null, d:null, e:null,
            f:null, g:null, h:null, i:null, j:null,
            k:null, l:null, m:null, n:null, o:null,
            p:null, q:null, r:null, s:null, t:null,
            u:null, v:null, w:null, x:null, y:null, z:null
        };
    }
}