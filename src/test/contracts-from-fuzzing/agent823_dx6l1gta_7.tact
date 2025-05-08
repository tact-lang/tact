struct Mixed {
    a: Int as uint32;
    b: Int = 12345;
    c: Bool;
    d: String?;
}

contract OrderingAndSerialization(
    mixed: Mixed
) {

    receive() {}
}