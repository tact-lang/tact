struct L5 { val5: Int; }
struct L4 { l5: L5; val4: Int; }
struct L3 { l4: L4; val3: Int; }
struct L2 { l3: L3; val2: Int; }
struct L1 { l2: L2; val1: Int; }

contract DeepNestFive {
    root: L1;

    init() {
        self.root = L1{
            l2: L2{
                l3: L3{
                    l4: L4{
                        l5: L5{ val5: 5 }, val4: 4
                    },
                    val3: 3
                },
                val2: 2
            },
            val1: 1
        };
    }
}