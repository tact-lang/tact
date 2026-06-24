struct VeryDeep1 { d1: Int }
struct VeryDeep2 { prev: VeryDeep1 }
struct VeryDeep3 { prev: VeryDeep2 }
struct VeryDeep4 { prev: VeryDeep3 }
struct VeryDeep5 { prev: VeryDeep4 }

contract TestContract {
    val: VeryDeep5;
    init() {
        self.val = VeryDeep5 {
            prev: VeryDeep4 {
                prev: VeryDeep3 {
                    prev: VeryDeep2 {
                        prev: VeryDeep1{
                            d1: 999
                        }
                    }
                }
            }
        };
    }
}