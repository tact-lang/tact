struct NestedSerial {
    i: Int as uint4;
    s: String;
}

contract NestedSerialTest {
    val: NestedSerial;

    init() {
        self.val = NestedSerial{
            i: 15,
            s: "nested",
        };
    }
}