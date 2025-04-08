struct Inner {
    val: Int?;
}

contract TestContract {
    foo: Inner = Inner{ val: null };
}
