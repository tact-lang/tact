struct Foo {
    x: Int;
    y: Bool;
}

// Overflow in recursive call
fun functionTest(i: Int): Int {
    functionTest(2 * i);
    return 0;
}

contract ConstEvalNegativeTest {
    get fun test_struct(): Foo {
        return Foo {y: false, x: functionTest(pow2(253))};
    }
}
