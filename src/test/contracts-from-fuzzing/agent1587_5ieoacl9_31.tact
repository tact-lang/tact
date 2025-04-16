struct TestStruct {
    x: Int;
    y: Bool;
}

contract ManyFields {
    f1: TestStruct;
    f2: TestStruct;
    f3: TestStruct;
    f4: TestStruct;

    init() {
        self.f1 = TestStruct{x:1,y:true};
        self.f2 = TestStruct{x:2,y:false};
        self.f3 = TestStruct{x:3,y:true};
        self.f4 = TestStruct{x:4,y:false};
    }
}