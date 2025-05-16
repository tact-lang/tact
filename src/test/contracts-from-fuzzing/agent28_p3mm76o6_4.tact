struct DeepA {
    valA: Int;
}

struct DeepB {
    valB: DeepA;
}

struct DeepC {
    valC: DeepB;
}

contract VeryDeepNestedTest {
    deepValue: DeepC;

    init() {
        self.deepValue = DeepC {
            valC: DeepB {
                valB: DeepA {
                    valA: 42
                }
            }
        };
    }
}