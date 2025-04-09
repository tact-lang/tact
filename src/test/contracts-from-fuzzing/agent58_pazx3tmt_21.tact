struct Pair { first: Int; second: Int }

fun test() {
    let Pair { first: a, second: _ } = Pair { first: 7, second: 8 };
    dump(a);
}

contract Test {
    receive() {
        test();
    }
}
