struct InnerMost { x: Int; }
struct InnerWrap { y: InnerMost; }
struct Middle { z: InnerWrap; }
struct OuterMost { q: Middle; }

contract DeepWrap {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            q: Middle{
                z: InnerWrap{
                    y: InnerMost{ x: 123 }
                }
            }
        };
    }
}