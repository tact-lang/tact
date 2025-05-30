struct L10 { Data: Int; }
struct L9 { L10Field: L10; }
struct L8 { L9Field: L9; }
struct L7 { L8Field: L8; }
struct L6 { L7Field: L7; }
struct L5 { L6Field: L6; }
struct L4 { L5Field: L5; }
struct L3 { L4Field: L4; }
struct L2 { L3Field: L3; }
struct L1 { L2Field: L2; }

contract TestDeepChain {
    receive() {
        let s: L1 = L1 {
            L2Field: L2 {
                L3Field: L3 {
                    L4Field: L4 {
                        L5Field: L5 {
                            L6Field: L6 {
                                L7Field: L7 {
                                    L8Field: L8 {
                                        L9Field: L9 {
                                            L10Field: L10 { Data: 999 }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
        let _ = s.L2Field.L3Field.L4Field.L5Field.L6Field.L7Field.L8Field.L9Field.L10Field.Data;
        return;
    }
}
