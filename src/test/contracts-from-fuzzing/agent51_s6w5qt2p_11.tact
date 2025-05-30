struct Pair { a: Int; b: Int }

fun getPair(): Pair {
    return Pair { a: 123, b: 456 };
}

contract Test {
    receive() {
         let Pair { a, b } = getPair();
         dump(a);
         dump(b);
    }
}
