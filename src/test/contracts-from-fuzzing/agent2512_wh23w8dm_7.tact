struct DeepA { one: Int; }
struct DeepB { a: DeepA; }
struct DeepC { b: DeepB; }
struct DeepD { c: DeepC; }
struct DeepE { d: DeepD; }

contract VeryDeepNesting {
    data: DeepE;

    init() {
        self.data = DeepE{ d: DeepD{ c: DeepC{ b: DeepB{ a: DeepA{ one: 11 } } } } };
    }
}