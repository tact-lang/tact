struct Two { a: Int; b: Int }

fun test2(t: Two): Int {
    let Two { a, b: _ } = t;
    return a;
}

contract Test {
    receive() {
        dump(test2(Two { a: 1, b: 2 }));
    }
}
