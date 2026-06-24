struct Pair { first: Int; second: Int }

fun usePair(): Int {
    // Using wildcard in destructuring pattern to discard 'second'
    let Pair { first: a, second: _ } = Pair { first: 10, second: 20 };
    return a;
}

contract Test {
    receive() {
        dump(usePair());
    }
}
