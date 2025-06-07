struct Pair { first: Int; second: Int }

contract TestDestructValid {
    receive() {
        let p = Pair { first: 10, second: 20 };
        let Pair { first: _, second: _ } = p;
    }
}
