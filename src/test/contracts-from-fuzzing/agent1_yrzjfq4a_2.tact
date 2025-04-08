struct LongStruct {
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

contract ManyFieldsStorage {
    value: LongStruct;

    init() {
        self.value = LongStruct{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10
        };
    }
}