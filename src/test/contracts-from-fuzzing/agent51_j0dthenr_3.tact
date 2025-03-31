struct MyTuple {
    a: Int;
    b: Bool;
}

contract TestTuple {
    receive() {}

    get fun getTuple(): MyTuple {
        return MyTuple{ a: 1, b: true };
    }
}
