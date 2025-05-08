struct Inner {
    foo: Int;
    bar: Bool;
    note: String = "bar";
}

contract StructStorage {
    inner: Inner = Inner{ foo: 7, bar: true };
}