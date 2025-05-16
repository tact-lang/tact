struct DeepNest3 { val3: Int; }
struct DeepNest2 { inner3: DeepNest3; }
struct DeepNest1 { inner2: DeepNest2; }

contract VeryDeepNested {
    data: DeepNest1;

    init() {
        self.data = DeepNest1{
            inner2: DeepNest2{
                inner3: DeepNest3{
                    val3: 42
                }
            }
        };
    }
}