struct InnerLevel3 {
    x: Int;
}

struct InnerLevel2 {
    inner3: InnerLevel3;
}

struct InnerLevel1 {
    inner2: InnerLevel2;
}

contract ThreeDeepNest {
    nested: InnerLevel1;

    init() {
        self.nested = InnerLevel1{ inner2: InnerLevel2{ inner3: InnerLevel3{ x: 5 } } };
    }
}