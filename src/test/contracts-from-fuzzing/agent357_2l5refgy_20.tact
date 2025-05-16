struct SerializeInts {
    a: Int as int64;
    b: Int as uint8;
    c: Int;
}

contract TestContract {
    val: SerializeInts;

    init() {
        self.val = SerializeInts{ a:10, b:20, c:30 };
    }
}