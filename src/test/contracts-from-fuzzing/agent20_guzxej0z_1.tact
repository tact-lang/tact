fun getAnswer(): Int {
    return 42;
}

// Invoking the function so that it is used (even though no runtime behavior is needed for compile testing)
fun main() {
    let a = getAnswer();
    dump(a);
}
