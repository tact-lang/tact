struct BigStruct {
    a: Int; b: Int; c: Int;
    d: Bool; e: Bool; f: Bool;
    g: String; h: String;
    i: Int?; j: Bool?; k: String?;
}

contract ManyFields {
    stored: BigStruct;

    init() {
        self.stored = BigStruct{
            a: 1, b:2, c:3,
            d:true, e:false, f:true,
            g:"foo", h:"bar",
            i:null, j:null, k:null
        };
    }
}
