struct A {
    x: Int;
}
contract OptNoInit {
    x: A?;

    init() {
        // Don't assign optional persistent storage field
    }
}