struct Level1 {
    field1: Int;
}

struct Level2 {
    inner: Level1;
}

struct Level3 {
    inner: Level2;
}

struct Level4 {
    inner: Level3;
}

struct Level5 {
    inner: Level4;
}

struct Level6 {
    inner: Level5;
}

struct Level7 {
    inner: Level6;
}

struct Level8 {
    inner: Level7;
}

 struct Level9 {
    inner: Level8;
}

contract DeepNine {
    data: Level9;

    init() {
        self.data = Level9{
            inner: Level8{
                inner: Level7{
                    inner: Level6{
                        inner: Level5{
                            inner: Level4{
                                inner: Level3{
                                    inner: Level2{
                                        inner: Level1{ field1: 99 }
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