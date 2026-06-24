struct DeeplyNested {
    level1: Nested1;
}

struct Nested1 {
    level2: Nested2;
}

struct Nested2 {
    level3: Nested3;
}

struct Nested3 {
    level4: Nested4;
}

struct Nested4 {
    a: Int;
    b: String;
    c: Bool;
}

contract TestContract {
    s: DeeplyNested;
    
    init() {
        self.s = DeeplyNested{
            level1: Nested1{
                level2: Nested2{
                    level3: Nested3{
                        level4: Nested4{a: 1, b: "ok", c: true}
                    }
                }
            }
        };
    }
}
