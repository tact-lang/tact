asm fun asmTest(x: Int): Int { INC }

fun asmWrapper(x: Int): Int {
    return asmTest(x) + 5;
}

fun main() {
    dump(asmWrapper(10));
}
