struct DeeplyNested {
    n1: N1;
}
struct N1 {
    n2: N2;
}
struct N2 {
    n3: N3;
}
struct N3 {
    n4: N4;
}
struct N4 {
    n5: N5;
}
struct N5 {
    x: Int;
}
contract StorageTest {
    test: DeeplyNested;

    init() {
        self.test = DeeplyNested{
            n1: N1{
                n2: N2{
                    n3: N3{
                        n4: N4{
                            n5: N5{
                                x: 999
                            }
                        }
                    }
                }
            }
        };
    }
}