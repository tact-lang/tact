fun square(x: Int): Int {
    return x * x;
}

fun main() {
    // The main function calls square(4) explicitly
    let result: Int = square(4);
    dump(result); // Expected output: 16
}
