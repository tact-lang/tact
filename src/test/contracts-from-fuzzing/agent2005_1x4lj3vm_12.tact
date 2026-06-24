struct VeryDeep1 { x: Int }
struct VeryDeep2 { d1: VeryDeep1 }
struct VeryDeep3 { d2: VeryDeep2 }
struct VeryDeep4 { d3: VeryDeep3 }
struct VeryDeep5 { d4: VeryDeep4 }
struct VeryDeep6 { d5: VeryDeep5 }

contract DeepPersistent {
    big: VeryDeep6;

    init() {
        self.big = VeryDeep6{
            d5: VeryDeep5{
                d4: VeryDeep4{
                    d3: VeryDeep3{
                        d2: VeryDeep2{
                            d1: VeryDeep1{ x: 42 }
                        }
                    }
                }
            }
        };
    }
}