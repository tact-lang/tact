struct TestData {
    f1: Int; f2: Bool; f3: String; f4: Int?; f5: String?;
    f6: Int as uint32; f7: Int as int64; f8: Int as coins;
}

contract Test {
    storage: TestData;

    init() {
        self.storage = TestData{
            f1:42, f2:true, f3:"abc", f4:null, f5:null,
            f6:123, f7:9876, f8:1000000
        };
    }
}
