struct Example { number: Int }

fun testDestructuring() {
    let Example { number } = Example { number: 42 };
    dump(number);
}

contract Test {
    receive() {
        testDestructuring();
    }
}
