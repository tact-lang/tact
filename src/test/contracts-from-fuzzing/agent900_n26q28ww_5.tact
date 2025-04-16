struct VeryDeep1 { a: Int; }
struct VeryDeep2 { v1: VeryDeep1; }
struct VeryDeep3 { v2: VeryDeep2; }
struct VeryDeep4 { v3: VeryDeep3; }
struct VeryDeep5 { v4: VeryDeep4; }

contract Test {
    deep: VeryDeep5;

    init() {
        self.deep = VeryDeep5 {
            v4: VeryDeep4 {
                v3: VeryDeep3 {
                    v2: VeryDeep2 {
                        v1: VeryDeep1 { a: 123 }
                    }
                }
            }
        };
    }

    receive() {
        let prev = self.deep.v4.v3.v2.v1.a;
        self.deep = VeryDeep5 {
            v4: VeryDeep4 {
                v3: VeryDeep3 {
                    v2: VeryDeep2 {
                        v1: VeryDeep1 { a: prev + 1 }
                    }
                }
            }
        };
    }
}