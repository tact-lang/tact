struct MixInStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Bool?;
    f: Int?;
    g: String?;
}

contract ContractWithMixStruct {
    field: MixInStruct;

    init() {
        self.field = MixInStruct{
            a:1, b:true, c:"s", d:myAddress(), e:null, f:null, g:null
        };
    }
}