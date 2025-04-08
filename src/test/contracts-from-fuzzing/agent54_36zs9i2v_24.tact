struct MixStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
}

contract ComboFields {
    s: MixStruct;

    init() {
        self.s = MixStruct{
            a:100,
            b:true,
            c:null,
            d:false
        };
    }
}