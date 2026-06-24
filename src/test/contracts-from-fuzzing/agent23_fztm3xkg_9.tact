struct Pair { first: Int; second: Int }

fun testPair(): Pair { return Pair { first: 10, second: 20 } }

contract TestDestructGood {
    receive() {
        let Pair { first, second, } = testPair();
        dump(first);
        dump(second);
        return;
    }
}
