struct Inner {
    x: Int;
    y: Int?;
}

contract NestedStructTest {
    s: Inner = Inner{ x: 1, y: null };
}