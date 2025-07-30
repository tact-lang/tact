struct Example { number: Int }

fun get42(): Example { return Example { number: 42 } }

fun testDestructuring() {
    // Destructuring assignment test
    let Example { number } = get42();
    dump(number);
}

contract Test {
    receive() {
        testDestructuring();
    }
}
