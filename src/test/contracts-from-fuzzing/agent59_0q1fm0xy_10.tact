struct Example { a: Int; b: Int }

fun getExample(): Example {
    return Example { a: 10, b: 20 };
}

contract TestDestructure {
    receive() {
         let Example { a, b } = getExample();
         dump(a);
         dump(b);
    }
}
