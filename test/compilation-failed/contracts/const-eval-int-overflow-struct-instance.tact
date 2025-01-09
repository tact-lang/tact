struct Foo {
    x: Int;
    y: Bool;
}

contract ConstEvalNegativeTest {
    get fun test_struct(): Foo {
        return Foo {y: false, x: pow2(255) * 2};
    }
}
