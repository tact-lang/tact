fun nestedIfTest(x: Int) : Int {
    if (x < 0) {
         return 0;
    } else if (x == 0) {
         return 1;
    } else {
         return 2;
    }
}

fun main() : Int {
    return nestedIfTest(10);
}
