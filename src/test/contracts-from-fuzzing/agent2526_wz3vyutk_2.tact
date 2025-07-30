struct Inner {
    val1: Int;
    val2: Bool;
}

contract TestStorage {
    nested: Inner = Inner{ val1: 12, val2: true };
}