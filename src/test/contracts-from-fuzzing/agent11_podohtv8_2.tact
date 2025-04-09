struct Pair { a: Int; b: Int }

fun nestedReturn(x: Int): Int {
    if (x > 0) {
        { return x * 2; }
    }
    return 0;
}

fun maybeReturn(b: Bool): Int? {
    if (b) { return 42; } else { return null; }
}

contract TestGetter {
    get fun getPair(): Pair? {
         if (1 > 0) { return Pair { a: 10, b: 20 }; } else { return null; }
    }
}

contract ReceiverTest {
    receive() {
         return;
    }
}

fun deepReturn(x: Int): Int {
    { if (x < 0) { return -1; } }
    return x;
}
