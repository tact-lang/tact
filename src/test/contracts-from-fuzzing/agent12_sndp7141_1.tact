fun testIf1(): Int {
    if (true) { 
        return 1; 
    } else { 
        return 0; 
    }
}

fun testIf2(): Int {
    if (false) { 
        return 10; 
    } 
    return 20;
}

fun testIf3(): Int {
    if (false) { 
        return 100; 
    } else if (2 + 2 == 4) {
        return 200;
    } else {
        return 300;
    }
}

// Entry point function to call and test the if statements. 
fun main(): Int {
    // Calling the test functions
    let a = testIf1();
    let b = testIf2();
    let c = testIf3();
    return a + b + c;
}
