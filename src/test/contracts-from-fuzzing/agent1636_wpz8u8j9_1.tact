struct DeeplyNested {
    inner: Level1;
}

struct Level1 {
    child: Level2;
}

struct Level2 {
    child: Level3;
}

struct Level3 {
    child: Level4;
}

struct Level4 {
    child: Level5;
}

struct Level5 {
    value: Int;
}

contract TestNested {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            inner: Level1{
                child: Level2{
                    child: Level3{
                        child: Level4{
                            child: Level5{value: 42}
                        }
                    }
                }
            }
        };
    }
}
