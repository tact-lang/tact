struct L10 {
    x: Int
}

struct L9 {
    level10: L10
}

struct L8 {
    level9: L9
}

struct L7 {
    level8: L8
}

struct L6 {
    level7: L7
}

struct L5 {
    level6: L6
}

struct L4 {
    level5: L5
}

struct L3 {
    level4: L4
}

struct L2 {
    level3: L3
}

struct L1 {
    level2: L2
}

contract TestDeepNested {
    receive() {
        let d: L1 = L1 {
            level2: L2 {
                level3: L3 {
                    level4: L4 {
                        level5: L5 {
                            level6: L6 {
                                level7: L7 {
                                    level8: L8 {
                                        level9: L9 {
                                            level10: L10 { x: 123 }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
        let _ = d.level2.level3.level4.level5.level6.level7.level8.level9.level10.x;
        return;
    }
}
