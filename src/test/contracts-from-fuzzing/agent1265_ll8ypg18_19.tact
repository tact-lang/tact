struct ManyFields {
    a: Int; b: Int?; c: Bool?; d: String; e: String?; f: Bool; g: Int?; h: Bool; i: String?; j: Int;
}

contract ComboLayout {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            a:1, b:null, c:true, d:"hi", e:null, f:false, g:99, h:true, i:null, j:42
        };
    }
}