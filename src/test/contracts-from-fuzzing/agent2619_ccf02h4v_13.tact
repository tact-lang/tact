struct DeepA { b: DeepB; }
struct DeepB { c: DeepC; }
struct DeepC { d: DeepD; }
struct DeepD { e: Int; }

contract VeryDeepNest {
    s: DeepA;
    init() {
        self.s = DeepA{ b: DeepB{ c: DeepC{ d: DeepD{ e:42 } } } };
    }
}