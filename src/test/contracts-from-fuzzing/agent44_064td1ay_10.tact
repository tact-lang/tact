struct Pair { first: Int; second: Int }

contract TestDestructuring {
    receive() {
        let Pair { first, second } = Pair { first: 10, second: 20 };
        dump(first + second);
    }
}
