struct Pair { first: Int; second: Int }

contract TestDestructuring {
    receive() {
        let p: Pair = Pair { first: 10, second: 20 };
        let Pair { first, second } = p;
        dump(first);
        dump(second);
    }
}
