struct DeepNest1 { val: Int; }
struct DeepNest2 { inner: DeepNest1; }
struct DeepNest3 { inner: DeepNest2; }
struct DeepNest4 { inner: DeepNest3; }
struct DeepNest5 { inner: DeepNest4; }

contract DeepNestedLevelsTest {
    val: DeepNest5;

    init() {
        self.val = DeepNest5{
            inner: DeepNest4{
                inner: DeepNest3{
                    inner: DeepNest2{
                        inner: DeepNest1{val: 42}
                    }
                }
            }
        };
    }
}