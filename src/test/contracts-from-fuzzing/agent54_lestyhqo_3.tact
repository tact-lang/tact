struct MyTuple {
    a: Int;
    b: Int;
}

contract TestStruct {
    receive() {}

    get fun getTuple(): MyTuple? {
        return MyTuple{ a: 10, b: 20 };
    }
}
