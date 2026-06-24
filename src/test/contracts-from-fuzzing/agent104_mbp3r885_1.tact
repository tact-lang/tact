fun test1(a: Int): Int {
    if (a > 10) {
        return a;
    } else {
        {
           if (a < 0) {
              return 0;
           }
        }
    }
    return a * 2;
}

fun main() {
    // Just a driver to ensure compilation
    let _ = test1(15);
    let _ = test1(-5);
    let _ = test1(5);
}