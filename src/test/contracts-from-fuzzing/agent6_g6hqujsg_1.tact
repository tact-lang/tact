fun getTimeFromNow(offset: Int): Int {
    return offset + 1000;
}

// A minimal main function to trigger execution
fun main() {
    // This should compile without errors
    let x = getTimeFromNow(42);
    dump(x);
}