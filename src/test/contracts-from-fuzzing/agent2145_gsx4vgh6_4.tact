struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract StorageTest {
    val: OptStruct;

    init() {
        self.val = OptStruct{ a: null, b: true, c: null };
    }
}