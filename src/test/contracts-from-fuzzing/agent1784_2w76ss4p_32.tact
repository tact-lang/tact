struct StructManyBool {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
}

contract ManyBools {
    rec: StructManyBool;

    init() {
        self.rec = StructManyBool{
            a:true,b:false,c:true,d:false,e:true
        };
    }
}