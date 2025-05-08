struct Pair { first: Int; second: Int }

fun takeFirst(p: Pair) {
    let Pair { first, second: _ } = p;
    dump(first);
}

contract TestDestructuring {
    receive() {
        takeFirst(Pair { first: 42, second: 100 });
    }
}
