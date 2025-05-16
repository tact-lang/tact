struct Layer1 {
    f: Layer2;
}

struct Layer2 {
    f: Layer3;
}

struct Layer3 {
    f: Layer4;
}

struct Layer4 {
    f: Layer5;
}

struct Layer5 {
    f: Layer6;
}

struct Layer6 {
    f: Layer7;
}

struct Layer7 {
    f: Layer8;
}

struct Layer8 {
    f: Layer9;
}

struct Layer9 {
    value: Int;
}

contract Test {
    field: Layer1;

    init() {
        self.field = Layer1{
            f: Layer2{
                f: Layer3{
                    f: Layer4{
                        f: Layer5{
                            f: Layer6{
                                f: Layer7{
                                    f: Layer8{
                                        f: Layer9{value: 42}
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}