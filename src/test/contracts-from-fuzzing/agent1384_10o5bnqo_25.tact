struct AltStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
}

contract ManyVarTypes {
    one: AltStruct;
    two: AltStruct;

    init() {
        self.one = AltStruct{a:1,b:true,c:"hi",d:myAddress()};
        self.two = AltStruct{a:2,b:false,c:"bye",d:myAddress()};
    }
}