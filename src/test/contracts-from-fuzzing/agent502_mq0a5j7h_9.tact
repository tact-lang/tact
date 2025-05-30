struct OneField { x: Int; }
struct TwoField { a: Bool; b: OneField; }
struct ThreeField { c: String; d: TwoField; }

contract NestedChain {
    data: ThreeField;

    init() {
        self.data = ThreeField{
            c: "hey",
            d: TwoField{
                a: true,
                b: OneField{
                    x: 42
                }
            }
        };
    }
}