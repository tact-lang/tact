struct Level10 { f: Int; }
struct Level9 { level10: Level10; }
struct Level8 { level9: Level9; }
struct Level7 { level8: Level8; }
struct Level6 { level7: Level7; }
struct Level5 { level6: Level6; }
struct Level4 { level5: Level5; }
struct Level3 { level4: Level4; }
struct Level2 { level3: Level3; }
struct Level1 { level2: Level2; }

contract TestDeepChainTen {
    receive() {
        let s: Level1 = Level1 {
            level2: Level2 {
                level3: Level3 {
                    level4: Level4 {
                        level5: Level5 {
                            level6: Level6 {
                                level7: Level7 {
                                    level8: Level8 {
                                        level9: Level9 {
                                            level10: Level10 { f: 42 }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
        s.level2.level3.level4.level5.level6.level7.level8.level9.level10.f;
    }
}
