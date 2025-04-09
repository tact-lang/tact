struct MyTuple {
    a: Int;
    b: Bool;
}

contract TestCompositeGetter {
    receive() {}

    // Getter returning a tuple wrapped in a struct as per documentation
    get fun getTuple(): MyTuple? {
         return MyTuple{ a: 123, b: true };
    }
}
