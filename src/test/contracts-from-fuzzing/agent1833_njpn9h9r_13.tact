struct DeepA1 { x: Int; }
struct DeepA2 { y: DeepA1; }
struct DeepA3 { z: DeepA2; }

struct DeepB1 { foo: Bool; }
struct DeepB2 { bar: DeepB1; }
struct DeepB3 { baz: DeepB2; }

contract TwoDeepVars {
    first: DeepA3;
    second: DeepB3;
    init() {
        self.first = DeepA3 { z: DeepA2 { y: DeepA1 { x: 10 } } };
        self.second = DeepB3 { baz: DeepB2 { bar: DeepB1 { foo: true } } };
    }
}
