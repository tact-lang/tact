struct SerializeMix {
    a: Int as uint16;
    b: Int?;
    c: Int as uint8;
    d: Int?;
    e: Int;
}

contract TestContract(val: SerializeMix) {
    receive() {
        let _ = self.val;
    }
}