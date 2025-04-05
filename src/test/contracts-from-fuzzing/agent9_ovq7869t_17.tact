struct MyTuple {
    x: Int;
    y: Bool;
}

contract Test {
    fun test(): MyTuple {
        return MyTuple{ x: 1, y: false };
    }
    receive() {
        self.test();
    }
}