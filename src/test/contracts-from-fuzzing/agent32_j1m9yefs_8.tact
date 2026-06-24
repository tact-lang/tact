struct Two { first: Int; second: Int; }

fun testDestructuringDiscard(): Int {
    let s: Two = Two { first: 10, second: 20 };
    let Two { first, second: _ } = s;
    return first;
}

contract TestDiscardDestructuring {
    receive() {
        dump(testDestructuringDiscard());
    }
}
