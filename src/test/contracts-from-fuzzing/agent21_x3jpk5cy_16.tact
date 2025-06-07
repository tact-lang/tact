struct Pair { x: Int; y: Int }

fun testPair(p: Pair): Int {
    // Discard field 'y' using the wildcard syntax in struct destructuring
    let Pair { x, y: _ } = p;
    return x;
}

contract Test {
    receive() { 
        testPair(Pair { x: 10, y: 20 }); 
    }
}
