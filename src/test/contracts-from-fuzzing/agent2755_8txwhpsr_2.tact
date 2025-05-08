struct Inner {
    a: Int;
    b: Bool;
}

contract StorageTest {
    nested: Inner = Inner{a: 1, b: true};
}