fun fact(n: Int, acc: Int) : Int {
    if (n == 0) { return acc; } else { return fact(n - 1, n * acc); }
}

fun main() : Int {
    return fact(5, 1);
}
