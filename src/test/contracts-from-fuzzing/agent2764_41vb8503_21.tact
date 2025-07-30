struct ManyFields {
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

contract ManyStructs {
    m1: ManyFields;
    m2: ManyFields;
    m3: ManyFields;

    init() {
        let dummy = ManyFields{a:0,b:1,c:2,d:3,e:4,f:5,g:6,h:7,i:8,j:9};
        self.m1 = dummy;
        self.m2 = dummy;
        self.m3 = dummy;
    }
}