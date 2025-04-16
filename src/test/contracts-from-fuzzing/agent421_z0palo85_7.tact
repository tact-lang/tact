struct DeepNest1 { x: Int }
struct DeepNest2 { a: DeepNest1 }
struct DeepNest3 { b: DeepNest2 }
struct DeepNest4 { c: DeepNest3 }
struct DeepNest5 { d: DeepNest4 }

contract DeeplyNested {
    payload: DeepNest5;
    init() {
        self.payload = DeepNest5 {
            d: DeepNest4 {
                c: DeepNest3 {
                    b: DeepNest2 {
                        a: DeepNest1 {
                            x: 9
                        }
                    }
                }
            }
        };
    }
}