fun testTryCatchBasic() {
    // This function tests basic try-catch where no exception is thrown
    try {
        // No throw here, so catch block should not trigger
        dump(42);
    } catch (err) {
        // This block should not execute
        dump(999);
    }
}

fun main() {
    testTryCatchBasic();
}
