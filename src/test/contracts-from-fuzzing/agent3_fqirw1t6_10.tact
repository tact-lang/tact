fun thrower(): Int { 
    throw(1042); 
}

fun tryCatchTest() : Int {
    try {
        return thrower();
    } catch (err) {
        return err;  // should return the exit code caught
    }
}

fun main(): Int {
    return tryCatchTest();
}
