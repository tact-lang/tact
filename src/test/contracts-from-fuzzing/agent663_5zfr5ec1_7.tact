struct DeepNest1 { inner: Int }
struct DeepNest2 { inner: DeepNest1 }
struct DeepNest3 { inner: DeepNest2 }
struct DeepNest4 { inner: DeepNest3 }
struct DeepNest5 { inner: DeepNest4 }

contract DeeplyNestedStructContract {
    nest: DeepNest5;

    init() {
        self.nest = DeepNest5{
            inner: DeepNest4{
                inner: DeepNest3{
                    inner: DeepNest2{
                        inner: DeepNest1{
                            inner: 123
                        }
                    }
                }
            }
        };
    }
}