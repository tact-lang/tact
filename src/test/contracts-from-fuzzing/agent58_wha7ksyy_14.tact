struct Data {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
}

contract NullableStructField {
    data: Data? = null;

    receive() {
        if (self.data != null) {
            let d = self.data!!;
            let _ = d.a + d.c + d.e;
        }
    }
}