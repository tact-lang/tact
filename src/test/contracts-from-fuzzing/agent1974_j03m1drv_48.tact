struct TestStruct {
    a: Int;
    b: Bool;
    c: Int?;
}

contract Redeclare {
    x: TestStruct;
    y: TestStruct;

    init() {
        self.x = TestStruct{ a:1, b:true, c:null };
        self.y = TestStruct{ a:2, b:false, c:3 };
    }
}
