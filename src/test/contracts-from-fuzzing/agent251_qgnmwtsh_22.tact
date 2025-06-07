struct DeepInner4 {
    v: Int;
}

struct DeepInner3 {
    d4: DeepInner4;
}

struct DeepInner2 {
    d3: DeepInner3;
}

struct DeepInner1 {
    d2: DeepInner2;
}

contract FourDeep {
    data: DeepInner1;

    init() {
        self.data = DeepInner1{
            d2: DeepInner2{
                d3: DeepInner3{
                    d4: DeepInner4{ v: 99 }
                }
            }
        };
    }
}