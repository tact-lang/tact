struct MultiStruct {
    x: Int;
    y: String;
    z: Bool;
}

contract InitMultiStruct {
    s1: MultiStruct;
    s2: MultiStruct;
    s3: MultiStruct;

    init() {
        self.s1 = MultiStruct{x:1,y:"a",z:true};
        self.s2 = MultiStruct{x:2,y:"b",z:false};
        self.s3 = MultiStruct{x:3,y:"c",z:true};
    }
}