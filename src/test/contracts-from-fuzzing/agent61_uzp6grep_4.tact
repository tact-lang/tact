struct MyTuple {
    first: Int;
    second: Bool;
}

contract TestGetterComposite {
    receive() {}

    get fun getComposite(): MyTuple {
         return MyTuple { first: 100, second: true };
    }
}
