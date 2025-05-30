struct Pair { first: Int; second: Int }

fun testPair(): Int {
    let Pair { first, second } = Pair { first: 3, second: 5 };
    return first + second;
}

contract Test {
    receive() {
        dump(testPair());  // Expected output: 8
    }
}
