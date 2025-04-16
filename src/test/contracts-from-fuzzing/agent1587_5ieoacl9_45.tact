struct O {
    opt: Inner?;
}

struct Inner {
    x: Int;
}

contract Top {
    o: O;

    init() {
        self.o = O{opt:null};
    }
}