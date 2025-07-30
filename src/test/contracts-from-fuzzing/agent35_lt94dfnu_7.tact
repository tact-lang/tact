struct Pair {
    a: Int;
    b: Int;
}

contract TestDestructuringValid {
    receive() {
         let Pair { a, b } = Pair { a: 10, b: 20 };
         dump(a);
         dump(b);
    }
}
