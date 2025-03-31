fun testThrowCatch() {
    // This function tests try-catch where exception is thrown in try
    try {
        throw(123); // throwing with exit code 123
    } catch (err) {
        // Catch block should capture catch code 123
        dump(err);
    }
}

fun main() {
    testThrowCatch();
}
