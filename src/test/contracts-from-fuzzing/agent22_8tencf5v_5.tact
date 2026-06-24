struct Wide {
    a: Int; b: Bool; c: String; d: Int?; e: String?;
    f: Bool?; g: Int; h: String; i: Bool; j: String?;
}

contract WideFieldsContract {
    storage: Wide;

    init() {
        self.storage = Wide{
            a:1, b:true, c:"c", d:null, e:null,
            f:null, g:2, h:"h", i:false, j:null
        };
    }
}