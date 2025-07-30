struct MixedTypes {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
}

contract MixedFieldTypes {
    m: MixedTypes;

    init() {
        self.m = MixedTypes{
            a:1,b:true,c:null,d:null,e:"e",f:null
        };
    }
}