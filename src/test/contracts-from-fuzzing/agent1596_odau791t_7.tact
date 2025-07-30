struct DeepNest1 { val: Int; }
struct DeepNest2 { inner: DeepNest1; }
struct DeepNest3 { inner: DeepNest2; }
struct DeepNest4 { inner: DeepNest3; }
struct DeepNest5 { inner: DeepNest4; }

contract VeryDeepNested {
    field: DeepNest5 = DeepNest5{
        inner: DeepNest4{
            inner: DeepNest3{
                inner: DeepNest2{
                    inner: DeepNest1{ val: 777 }
                }
            }
        }
    };
    receive() {
        let _ = self.field.inner.inner.inner.inner.val;
    }
}