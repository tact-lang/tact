struct DeepNest3 { val: Int }
struct DeepNest2 { inner: DeepNest3 }
struct DeepNest1 { inner: DeepNest2 }

contract TestDeepNesting {
    item: DeepNest1;

    init() {
        self.item = DeepNest1{
            inner: DeepNest2{
                inner: DeepNest3{
                    val: 42
                }
            }
        };
    }
}