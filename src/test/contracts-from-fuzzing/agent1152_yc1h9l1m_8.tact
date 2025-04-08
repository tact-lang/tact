struct DeepA { b: DeepB; }
struct DeepB { c: DeepC; }
struct DeepC { d: DeepD; }
struct DeepD { e: DeepE; }
struct DeepE { f: Int; }

contract Test {
    deep: DeepA;

    init() {
        self.deep = DeepA{ b: DeepB{ c: DeepC{ d: DeepD{ e: DeepE{ f: 9 }}}}};
    }
}