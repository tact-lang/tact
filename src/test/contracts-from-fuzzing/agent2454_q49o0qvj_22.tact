struct DeepCompose {
    nest1: N1;
}

struct N1 {
    nest2: N2;
}

struct N2 {
    nest3: N3;
}

struct N3 {
    nest4: N4;
}

struct N4 {
    nest5: N5;
}

struct N5 {
    num: Int;
}

contract DeepComposeTest {
    data: DeepCompose;

    init() {
        self.data = DeepCompose{
            nest1: N1{
                nest2: N2{
                    nest3: N3{
                        nest4: N4{
                            nest5: N5{
                                num: 42
                            }
                        }
                    }
                }
            }
        };
    }
}