struct Level10 { a: Int; }

struct Level9 { l10: Level10; }

struct Level8 { l9: Level9; }

struct Level7 { l8: Level8; }

struct Level6 { l7: Level7; }

struct Level5 { l6: Level6; }

struct Level4 { l5: Level5; }

struct Level3 { l4: Level4; }

struct Level2 { l3: Level3; }

struct Level1 { l2: Level2; }

contract TestNestedStruct {
    // Declare a state variable to force full compilation of nested struct instantiation
    value: Level1;

    init() {
        self.value = Level1 {
            l2: Level2 {
                l3: Level3 {
                    l4: Level4 {
                        l5: Level5 {
                            l6: Level6 {
                                l7: Level7 {
                                    l8: Level8 {
                                        l9: Level9 {
                                            l10: Level10 { a: 42 }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
    }

    receive() {}
}
