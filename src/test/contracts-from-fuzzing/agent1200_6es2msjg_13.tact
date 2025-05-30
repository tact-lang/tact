struct DeepNested4 {
    val: Int;
}

struct DeepNested3 {
    child: DeepNested4;
}

struct DeepNested2 {
    child: DeepNested3;
}

struct DeepNested1 {
    child: DeepNested2;
}

contract FourLevelNested {
    root: DeepNested1;
    init() {
        self.root = DeepNested1{
            child: DeepNested2{
                child: DeepNested3{
                    child: DeepNested4{
                        val: 999
                    }
                }
            }
        };
    }
}