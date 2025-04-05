struct A1 { x: Int; }
struct A2 { a1: A1; }
struct A3 { a2: A2; }
struct A4 { a3: A3; }
struct A5 { a4: A4; }
struct A6 { a5: A5; }
struct A7 { a6: A6; }
struct A8 { a7: A7; }
struct A9 { a8: A8; }
struct A10 { a9: A9; }
struct A11 { a10: A10; }
struct A12 { a11: A11; }
struct A13 { a12: A12; }
struct A14 { a13: A13; }
struct A15 { a14: A14; }

contract TestDeepChain15 {
    receive() {
        let deep = A15 {
            a14: A14 {
                a13: A13 {
                    a12: A12 {
                        a11: A11 {
                            a10: A10 {
                                a9: A9 {
                                    a8: A8 {
                                        a7: A7 {
                                            a6: A6 {
                                                a5: A5 {
                                                    a4: A4 {
                                                        a3: A3 {
                                                            a2: A2 {
                                                                a1: A1 { x: 42 }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
        dump(deep.a14.a13.a12.a11.a10.a9.a8.a7.a6.a5.a4.a3.a2.a1.x);
    }
}
