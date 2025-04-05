struct Level10 {
    Value: Int;
}

struct Level9 {
    Next: Level10;
}

struct Level8 {
    Next: Level9;
}

struct Level7 {
    Next: Level8;
}

struct Level6 {
    Next: Level7;
}

struct Level5 {
    Next: Level6;
}

struct Level4 {
    Next: Level5;
}

struct Level3 {
    Next: Level4;
}

struct Level2 {
    Next: Level3;
}

struct Level1 {
    Next: Level2;
}

contract DeepChainTest {
    receive() {
        let deep: Level1 = Level1 {
            Next: Level2 {
                Next: Level3 {
                    Next: Level4 {
                        Next: Level5 {
                            Next: Level6 {
                                Next: Level7 {
                                    Next: Level8 {
                                        Next: Level9 {
                                            Next: Level10 { Value: 999 }
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
}
