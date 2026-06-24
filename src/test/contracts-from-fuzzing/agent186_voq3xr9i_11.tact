struct VeryDeep1 {
    a: Int;
}
struct VeryDeep2 {
    b: VeryDeep1;
}
struct VeryDeep3 {
    c: VeryDeep2;
}
struct VeryDeep4 {
    d: VeryDeep3;
}
struct VeryDeep5 {
    e: VeryDeep4;
}
struct VeryDeep6 {
    f: VeryDeep5;
}
struct VeryDeep7 {
    g: VeryDeep6;
}

contract VeryDeepTest {
    testField: VeryDeep7;

    init() {
        self.testField = VeryDeep7{
            g: VeryDeep6{
                f: VeryDeep5{
                    e: VeryDeep4{
                        d: VeryDeep3{
                            c: VeryDeep2{
                                b: VeryDeep1{a: 77}
                            }
                        }
                    }
                }
            }
        };
    }
}