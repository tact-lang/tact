// Deeply nested struct many layers deep
struct L4 { val4: Int; }
struct L3 { val3: L4; }
struct L2 { val2: L3; }
struct L1 { val1: L2; }

contract TestDeep {
    d: L1;

    init() {
        self.d = L1{
            val1: L2{
                val2: L3{
                    val3: L4{
                        val4: 88
                    }
                }
            }
        };
    }
}