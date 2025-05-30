struct Mixed {
    ival: Int;
    sval: String;
    bval: Bool;
}

contract Multivar {
    a: Mixed;
    b: Mixed;
    c: Mixed;

    init() {
        self.a = Mixed{ ival: 1, sval: "a", bval:true };
        self.b = Mixed{ ival: 2, sval: "b", bval:false };
        self.c = Mixed{ ival: 3, sval: "c", bval:true };
    }
}