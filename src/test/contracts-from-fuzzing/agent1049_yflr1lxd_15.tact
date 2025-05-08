struct BigFields {
    a: Int; b: Bool; c: String; d: Int?; e: String?; f: Bool; g: Int?; h: String; i: Bool?; j: Int; k: String?; l: Bool; m: Int; n: String; o: Bool; p: Int?;
}

contract BigStorage {
    field: BigFields;

    init() {
        self.field = BigFields{
            a:1, b:true, c:"x", d:null, e:null, f:false, g:99,
            h:"y", i:true, j:77, k:"z", l:true, m:33, n: "qq",
            o:false, p:null
        };
    }
}