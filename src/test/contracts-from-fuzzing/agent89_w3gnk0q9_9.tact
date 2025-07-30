struct MyTuple {
    first: Int;
    second: Bool;
}

contract TestTuple {
    t: MyTuple = MyTuple{ first: 7, second: true };

    receive() {}

    // Getter function returning an optional composite type (tuple wrapped in a struct)
    get fun getTuple(): MyTuple? {
        return self.t;
    }
}
