struct WideNested {
    sub: SubStruct;
    a: Int; b: Bool; c: Int?; d: Bool?;
    e: Int; f: Bool; g: Int?; h: Bool?;
    i: Int; j: Bool; k: Int?; l: Bool?;
}

struct SubStruct {
    m: Int; n: Bool; o: Int?; p: Bool?;
}

contract WideContract {
    data: WideNested;

    init() {
        self.data = WideNested{
            sub: SubStruct { m:1, n:true, o:null, p:false },
            a:2, b:false, c:null, d:true,
            e:3, f:true, g:null, h:false,
            i:4, j:false, k:null, l:true,
        };
    }
}