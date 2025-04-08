struct SuperDeep1 { v: Int; }
struct SuperDeep2 { d1: SuperDeep1; }
struct SuperDeep3 { d2: SuperDeep2; }
struct SuperDeep4 { d3: SuperDeep3; }
struct SuperDeep5 { d4: SuperDeep4; }
struct SuperDeep6 { d5: SuperDeep5; }
struct SuperDeep7 { d6: SuperDeep6; }

contract UltraDeepNesting {
    x: SuperDeep7;

    init() {
        self.x = SuperDeep7{
            d6: SuperDeep6{
                d5: SuperDeep5{
                    d4: SuperDeep4{
                        d3: SuperDeep3{
                            d2: SuperDeep2{
                                d1: SuperDeep1{ v: 1 }
                            }
                        }
                    }
                }
            }
        };
    }
}
