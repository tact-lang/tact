struct ManyOptionFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract ManyOptionInStruct {
    val: ManyOptionFields;
    init() {
        self.val = ManyOptionFields{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}