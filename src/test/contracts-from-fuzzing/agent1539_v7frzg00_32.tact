struct BigStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
}

contract ManyBigs {
    x: BigStruct;
    y: BigStruct;
    z: BigStruct;
    init() {
        self.x = BigStruct{a:1,b:2,c:3,d:4,e:5,f:6};
        self.y = BigStruct{a:6,b:5,c:4,d:3,e:2,f:1};
        self.z = BigStruct{a:0,b:0,c:0,d:0,e:0,f:0};
    }
}