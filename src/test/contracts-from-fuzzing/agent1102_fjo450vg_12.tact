struct InnerMost {
    val: Int;
}

struct Level2 {
    inner: InnerMost;
}

struct Level1 {
    inner2: Level2;
}

struct Container {
    inner1: Level1;
}

contract NestedAllStruct {
    root: Container;

    init() {
        self.root = Container{
            inner1: Level1{
                inner2: Level2{
                    inner: InnerMost{ val: 42 }
                }
            }
        };
    }
}
