struct Deep {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Int as uint32;
    i: Cell;
    j: Slice;
    k: Builder;
    l: Address;
}

contract ManyPersist {
    field1: Deep;
    field2: Deep;
    field3: Deep;
    field4: Deep;
    field5: Deep;

    init() {
        self.field1 = Deep{ a:1,b:true,c:"c",d:null,e:null,f:null,g:8,h:9,i:emptyCell(),j:emptyCell().asSlice(),k:beginCell(),l:myAddress() };
        self.field2 = self.field1;
        self.field3 = self.field1;
        self.field4 = self.field1;
        self.field5 = self.field1;
    }
}
