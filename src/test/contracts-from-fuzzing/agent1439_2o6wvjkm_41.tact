struct WideNested {
    a: Int as uint8;
    b: Int? = null;
    c: String = "test";
    d: Bool = true;
    e: Int as int128;
    f: Int? as uint16;
    g: Int? as int16 = null;
}

contract MegaPersistent {
    field1: WideNested;
    field2: WideNested;
    init() {
        self.field1 = WideNested{a:7,b:null,c:"one",d:true,e:77,f:null,g:null};
        self.field2 = WideNested{a:3,b:4,c:"two",d:false,e:88,f:5,g:-6};
    }
}