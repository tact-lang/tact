inline fun inlineTest(a: Int): Int { 
    return a * 2; 
}

fun main() {
    dump(inlineTest(21)); // expected output: 42
}
