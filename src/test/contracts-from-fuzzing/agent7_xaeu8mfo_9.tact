struct Pair {
    a: Int;
    b: Int;
}

contract TestStructDump {
    // Testing debug dump on a custom struct by converting it to a Cell
    fun test(p: Pair) {
         dump(p.toCell());
    }

    receive() {
         self.test(Pair{ a: 10, b: 20 });
    }
}
