struct DeepA { val: Int; }
struct DeepB { a: DeepA; }
struct DeepC { b: DeepB; }
struct DeepD { c: DeepC; }

contract ManyDeepFields {
    d: DeepD;

    init() {
        self.d = DeepD{ c: DeepC{ b: DeepB{ a: DeepA{ val: 99 } } } };
    }
}
