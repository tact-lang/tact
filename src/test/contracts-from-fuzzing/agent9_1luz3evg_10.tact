struct L10 { value: Int; }
struct L9 { nested: L10; }
struct L8 { nested: L9; }
struct L7 { nested: L8; }
struct L6 { nested: L7; }
struct L5 { nested: L6; }
struct L4 { nested: L5; }
struct L3 { nested: L4; }
struct L2 { nested: L3; }
struct L1 { nested: L2; }

contract TestDeepChain {
    receive() {
        let deep = L1 {
            nested: L2 {
                nested: L3 {
                    nested: L4 {
                        nested: L5 {
                            nested: L6 {
                                nested: L7 {
                                    nested: L8 {
                                        nested: L9 {
                                            nested: L10 { value: 42 }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
        dump(deep.nested.nested.nested.nested.nested.nested.nested.nested.nested.value);
    }
}
