struct DeepNest1 { val: Int; }
struct DeepNest2 { inner: DeepNest1; }
struct DeepNest3 { inner: DeepNest2; }
struct DeepNest4 { inner: DeepNest3; }

contract DeepTest {
    val: DeepNest4;

    init() {
        self.val = DeepNest4{
            inner: DeepNest3{
                inner: DeepNest2{
                    inner: DeepNest1{ val: 7 }
                }
            }
        };
    }
}
