struct LargeStruct {
    a: Int; b: Bool; c: String; d: Address;
    e: Int?; f: Bool?; g: String?; h: Address?;
    i: Int; j: Bool; k: String; l: Address;
    m: Int?; n: Bool?; o: String?; p: Address?;
}

contract LargeStructField {
    s: LargeStruct;
    init() {
        self.s = LargeStruct{
            a:1, b:true, c:"x", d:myAddress(),
            e:null, f:null, g:null, h:null,
            i:2, j:false, k:"y", l:myAddress(),
            m:null, n:null, o:null, p:null
        };
    }
}
