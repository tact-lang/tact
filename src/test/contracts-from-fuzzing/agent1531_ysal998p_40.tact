struct TestStruct {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Bool;
    f: Bool?;
}

contract StorageTest {
    s: TestStruct;

    init() {
        self.s = TestStruct{
            a:1,
            b:null,
            c:"c",
            d:null,
            e:true,
            f:null
        };
    }
}
