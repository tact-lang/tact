struct Inner {
    a: Int;
    b: Bool;
}

contract ManyInnerOptionals {
    i1: Inner?;
    i2: Inner?;
    i3: Inner?;

    init() {
        self.i1 = null;
        self.i2 = null;
        self.i3 = null;
    }
}