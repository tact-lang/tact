struct Rec1 {
    r2: Rec2;
}
struct Rec2 {
    r3: Rec3;
}
struct Rec3 {
    r4: Rec4;
}
struct Rec4 {
    r5: Rec5;
}
struct Rec5 {
    r6: Rec6;
}
struct Rec6 {
    r7: Rec7;
}
struct Rec7 {
    v: Int;
}

contract Recurse7 {
    val: Rec1;
    init() {
        self.val = Rec1 {
            r2: Rec2 {
                r3: Rec3 {
                    r4: Rec4 {
                        r5: Rec5 {
                            r6: Rec6 {
                                r7: Rec7 {
                                    v: 99
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}
