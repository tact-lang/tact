struct VeryDeepNested {
    lev1: Lev2;
}

struct Lev2 {
    lev3: Lev3;
}

struct Lev3 {
    lev4: Lev4?;
}

struct Lev4 {
    data: Int;
}

contract DeepNestTest {
    foo: VeryDeepNested;
    init() {
        self.foo = VeryDeepNested {
            lev1: Lev2 {
                lev3: Lev3 {
                    lev4: Lev4 {
                        data: 7
                    }
                }
            }
        };
    }
}