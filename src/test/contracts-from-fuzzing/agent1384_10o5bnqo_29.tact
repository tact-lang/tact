struct IntStringBool {
    x: Int;
    y: String;
    z: Bool;
}

contract ManyStructs {
    a: IntStringBool;
    b: IntStringBool;
    c: IntStringBool;

    init() {
        self.a = IntStringBool{x:1,y:"a",z:true};
        self.b = IntStringBool{x:2,y:"b",z:false};
        self.c = IntStringBool{x:3,y:"c",z:true};
    }
}