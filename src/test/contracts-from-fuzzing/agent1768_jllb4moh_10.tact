struct TestStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract TestContract {
    s: TestStruct;

    init() {
        self.s = TestStruct{
            a: null,
            b: true,
            c: null,
            d: null
        };
    }

    receive() {
        if (self.s.a != null) {
            self.s.a = self.s.a!! + 1;
        } else {
            self.s.a = 1;
        }
    }
}