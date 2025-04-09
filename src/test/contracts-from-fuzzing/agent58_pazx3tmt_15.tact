struct S { a: Int; b: Int }

fun test() {
    let S { a, b: _ } = S { a: 5, b: 10 };
    dump(a);
    // Correctly, the discarded field _ is not available
    // Attempting to dump(_) here would yield an error
}

contract Test {
    receive() {
        test();
    }
}
