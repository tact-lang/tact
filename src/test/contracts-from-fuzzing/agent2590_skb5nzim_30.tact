struct Record {
    a: Int;
    b: Bool;
}

contract MutateTest {
    data: Record;
    init() {
        self.data = Record{ a:1, b:true };
    }
    receive() {
        self.data = Record{ a: 42, b: false };
    }
}