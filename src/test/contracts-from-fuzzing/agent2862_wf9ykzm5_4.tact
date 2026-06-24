struct Inner {
    flag: Bool?;
}

contract NestedOptionalTest {
    inner: Inner = Inner{ flag: null };
}