struct MyTuple {
    a: Int;
    b: Bool;
}

contract Test2 {
    v: Int = 42;
    receive() {}

    // Getter returning a composite struct instead of a tuple
    get fun getComposite(): MyTuple {
        return MyTuple{
            a: self.v,
            b: true
        };
    }
}
