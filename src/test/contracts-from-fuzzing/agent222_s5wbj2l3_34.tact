struct TestStruct {
    a: Int; 
    b: Bool;
}

contract PartialInit {
    var: TestStruct;

    init() {
        self.var = TestStruct{ a:10, b:true };
    }
}