struct LongStruct {
    a: Int; b: Bool; c: Int?; d: Bool?; e: Int; f: Bool;
    g: Int?; h: Bool?; i: Int; j: Bool; k: Int?; l: Bool?;
}

contract LongStructTest {
    s: LongStruct;

    init() {
        self.s = LongStruct{
            a:1, b:true, c:null, d:false, e:2, f:true,
            g: null, h: true, i:3, j:false, k:4, l:null
        };
    }
}