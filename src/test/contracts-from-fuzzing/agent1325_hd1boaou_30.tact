struct Inner {
    a: Int = 5;
    b: Bool = false;
}

contract TestContract {
    intVal: Int = 1;
    optInt: Int? = null;
    nested: Inner = Inner{ a: 5, b: false };
    nestedOpt: Inner? = null;

    receive() {
        self.intVal += 1;
    }
}