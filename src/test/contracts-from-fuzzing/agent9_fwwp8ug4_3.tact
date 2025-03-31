struct Example { number: Int }

fun testDestructure(): Int {
    // Testing destructuring assignment with trailing commas
    let Example { number, } = Example { number: 42, };
    return number;
}

contract Test {
    receive() {
        let result: Int = testDestructure();
        result;
    }
}
