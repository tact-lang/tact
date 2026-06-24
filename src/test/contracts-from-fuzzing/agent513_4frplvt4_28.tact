struct DeepA { val: Int; }
struct DeepB { a: DeepA; }
struct DeepC { b: DeepB; }
struct DeepD { c: DeepC; }

contract Test {
    dd: DeepD;

    init() {
        self.dd = DeepD {
            c: DeepC {
                b: DeepB {
                    a: DeepA { val: 777 }
                }
            }
        };
    }
    receive() {}
}