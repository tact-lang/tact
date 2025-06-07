fun greet(): String {
    return "Hello, Tact!";
}

fun callGreet(): String {
    // Explicitly calling greet() function
    return greet();
}

fun main(): String {
    // Main function calls callGreet()
    let result: String = callGreet();
    return result;
}
