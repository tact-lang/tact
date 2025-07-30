fun greet(): String {
    return "Hello, Tact!";
}

fun main() {
    // Call greet() function and capture its result
    let message: String = greet();

    // Use dump() to output the message, proving that the function is called
    dump(message);

    // Optionally, call greet() again to show multiple calls
    let anotherMessage: String = greet();
    dump(anotherMessage);
}
