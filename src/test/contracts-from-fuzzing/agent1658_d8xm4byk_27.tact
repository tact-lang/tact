struct MultiOpt {
    a: Int?;
    b: Bool?;
}

contract StorageTest {
    f1: MultiOpt;
    f2: MultiOpt;

    init() {
        self.f1 = MultiOpt{ a:null, b:true };
        self.f2 = MultiOpt{ a:123, b:null };
    }
}