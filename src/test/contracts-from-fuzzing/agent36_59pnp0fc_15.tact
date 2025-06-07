struct Triple { a: Int; b: Int; c: Int }

// Extension function: doubles the integer
extends fun double(self: Int): Int {
    return self + self;
}

// Function that uses destructuring assignment to ignore fields 'b' and 'c'
fun ignoreDestructure(t: Triple): Int {
    let Triple { a, .. } = t;
    return a;
}

// Main test function combining extension and destructuring
fun mainTest(): Int {
    let x = 5.double();           // Expected to be 10
    let t = ignoreDestructure(Triple { a: 7, b: 8, c: 9 }); // Expected to be 7
    return x + t;                 // Total should be 17
}
