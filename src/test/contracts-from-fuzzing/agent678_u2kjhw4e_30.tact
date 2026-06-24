struct Inner {
    id: Int;
    note: String?;
}

contract Test {
    val: Inner = Inner{ id: 5, note: null };
}