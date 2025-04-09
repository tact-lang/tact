struct Boxed {
    inner: Int;
}

contract LargeOptionals {
    o1: Boxed?;
    o2: Boxed?;
    o3: Boxed?;
    o4: Boxed?;
    o5: Boxed?;
    o6: Boxed?;

    init() {
        self.o1 = null;
        self.o2 = null;
        self.o3 = null;
        self.o4 = null;
        self.o5 = Boxed{inner:5};
        self.o6 = null;
    }
}
