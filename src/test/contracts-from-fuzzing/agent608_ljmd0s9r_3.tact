struct DeepA { val: Int }
struct DeepB { a: DeepA }
struct DeepC { b: DeepB }
struct DeepD { c: DeepC }

contract VeryDeepTest {
    x: DeepD;

    init() {
        self.x = DeepD{ c: DeepC{ b: DeepB{ a: DeepA{ val: 123 } } } };
    }
}
