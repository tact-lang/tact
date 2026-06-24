inline fun inc(x: Int): Int {
    return x + 1;
}

contract TestInline {
    receive() {
         dump(inc(5)); // expect 6
    }
}
