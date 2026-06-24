struct OptionalDeep {
    a: NestedInner?;
}

struct NestedInner {
    b: InnerDeep?;
}

struct InnerDeep {
    x: Int?;
    y: Bool?;
}

contract OptionalDeepTest {
    d: OptionalDeep;
    init() {
        self.d = OptionalDeep{
            a: NestedInner{
                b: InnerDeep{
                    x:null,
                    y:true
                }
            }
        };
    }
}