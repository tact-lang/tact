fun nestedReturnTest(flag: Bool): Int {
    if (flag) {
        { return 111; }
    }
    return 222;
}

fun main() {
    dump(nestedReturnTest(true));
    dump(nestedReturnTest(false));
}
