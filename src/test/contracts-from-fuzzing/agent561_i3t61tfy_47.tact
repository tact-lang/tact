struct SomeStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract ManyStructRefs {
    s1: SomeStruct;
    s2: SomeStruct;
    s3: SomeStruct;

    init() {
        self.s1 = SomeStruct{x:1,y:true,z:"a"};
        self.s2 = SomeStruct{x:2,y:false,z:"b"};
        self.s3 = SomeStruct{x:3,y:true,z:"c"};
    }
}