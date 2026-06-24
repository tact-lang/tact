struct WideStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
}

contract WideFields {
    s: WideStruct;
    intField1: Int;
    intField2: Int;
    intField3: Int;
    intField4: Int;
    intField5: Int;

    init() {
        self.s = WideStruct{a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10};
        self.intField1 = 11;
        self.intField2 = 12;
        self.intField3 = 13;
        self.intField4 = 14;
        self.intField5 = 15;
    }
}