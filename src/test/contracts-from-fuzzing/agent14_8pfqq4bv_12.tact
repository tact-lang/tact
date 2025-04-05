struct Many { a: Int; b: Int; c: Int; }

fun test_destructure_ignore(): Int {
    let Many { a, .. } = Many { a: 10, b: 20, c: 30 };
    return a;
}

contract TestDestructureIgnore {
    receive() {
        dump(test_destructure_ignore());
    }
}
