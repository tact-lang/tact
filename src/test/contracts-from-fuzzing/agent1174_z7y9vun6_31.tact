struct ZeroIntNested {
    val: Int = 0;
}

struct WrapZero {
    inner: ZeroIntNested;
}

contract NestedDefaultsTest {
    s: WrapZero = WrapZero{ inner: ZeroIntNested{} };
}