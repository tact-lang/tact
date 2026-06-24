struct DeepNest3 { c: Int; }
struct DeepNest2 { b: DeepNest3; }
struct DeepNest1 { a: DeepNest2; }

contract NestTest {
    val: DeepNest1;

    init() {
        self.val = DeepNest1{
            a: DeepNest2{
                b: DeepNest3{ c: 42 }
            }
        };
    }
}
