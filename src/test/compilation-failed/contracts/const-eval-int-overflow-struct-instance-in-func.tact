struct Foo {
    x: Int;
    y: Bool;
}

// Overflow in recursive call
fun funcTest(i: Int): Int {
    funcTest(2 * i);
    return 0;
}

contract ConstEvalNegativeTest {
    get fun test_struct(): Foo {
        return Foo {y: false, x: funcTest(pow2(253))};
    }
}
