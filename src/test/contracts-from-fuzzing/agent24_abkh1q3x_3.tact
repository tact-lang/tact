struct Many { one: Int; two: Int; three: Int; fans: Int }

fun test_ignore(): Int {
    let m: Many = Many { one: 1, two: 2, three: 3, fans: 4 };
    let Many { fans, .. } = m;
    return fans;
}

fun main() {
    dump(test_ignore());
}
