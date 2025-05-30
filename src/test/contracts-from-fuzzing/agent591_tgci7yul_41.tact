struct DeepA { a: Int; }
struct DeepB { b: DeepA; }
struct DeepC { c: DeepB; }
struct DeepD { d: DeepC; }
struct DeepE { e: DeepD; }

contract DeepMany {
    x: DeepE;
    init() {
        self.x = DeepE{ e: DeepD{ d: DeepC{ c: DeepB{ b: DeepA{ a: 3 } } } } };
    }
}