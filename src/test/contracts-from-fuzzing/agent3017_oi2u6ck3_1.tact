struct DeeplyNested {
    level1: Inner1;
}

struct Inner1 {
    level2: Inner2;
}

struct Inner2 {
    level3: Inner3;
}

struct Inner3 {
    level4: Inner4;
}

struct Inner4 {
    value: Int;
}

contract Test {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            level1: Inner1{
                level2: Inner2{
                    level3: Inner3{
                        level4: Inner4{ value: 42 }
                    }
                }
            }
        };
    }
}
