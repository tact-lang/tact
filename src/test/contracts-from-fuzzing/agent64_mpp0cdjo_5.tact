struct Pair { first: Int; second: Int }

fun addPair(p: Pair): Int {
    let Pair { first, second } = p;
    return first + second;
}

contract TestDestructuring {
    receive() {
        let p: Pair = Pair { first: 10, second: 32 };
        dump(addPair(p));
    }
}
