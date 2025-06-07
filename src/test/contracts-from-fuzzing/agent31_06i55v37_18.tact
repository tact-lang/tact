struct Pair { first: Int; second: Int }

contract Test {
    receive() {
        let Pair { first, second: _ } = Pair { first: 12, second: 34 };
        dump(first);
    }
}
