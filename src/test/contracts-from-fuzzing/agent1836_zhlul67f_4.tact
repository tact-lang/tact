struct InnerStruct {
    x: Int;
    y: Bool;
}

contract ManyStructFields {
    a: InnerStruct;
    b: InnerStruct;
    c: InnerStruct;
    d: InnerStruct;
    e: InnerStruct;

    init() {
        self.a = InnerStruct{ x:1, y:true };
        self.b = InnerStruct{ x:2, y:false };
        self.c = InnerStruct{ x:3, y:true };
        self.d = InnerStruct{ x:4, y:false };
        self.e = InnerStruct{ x:5, y:true };
    }
}