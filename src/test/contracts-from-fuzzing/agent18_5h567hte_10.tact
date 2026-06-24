fun ext(x: Int): Int {
    return x * 10;
}

extends fun ext(self: Int): Int {
    return self + 1;
}

fun main() {
    let y = 5.ext();
    dump(y);
}
