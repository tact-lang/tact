struct Two { first: Int; second: Int }

fun matchPair(pair: Two): Int {
    // Use wildcard for second field via aliasing
    let Two { first: a, second: _ } = pair;
    return a;
}

contract Test {
    receive() {
        let p = Two { first: 42, second: 99 };
        dump(matchPair(p)); // Expected output: 42
    }
}
