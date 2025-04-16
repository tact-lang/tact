struct Inner {
    a: Int;
}

contract DeepOptionals {
    o1: Inner? = null;
    o2: Inner? = null;
    o3: Inner? = null;
    o4: Inner? = null;
    o5: Inner? = null;

    init() {
        self.o2 = Inner{a: 2};
        self.o5 = Inner{a: 5};
    }
}