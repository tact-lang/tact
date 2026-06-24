struct Pair { first: Int; second: Int }

fun testDestruct() {
    let Pair { first, second } = Pair{ first: 10, second: 20 };
    dump(first);   // expected output: 10
    dump(second);  // expected output: 20
}

contract Test {
    receive() {
        testDestruct();
    }
}
