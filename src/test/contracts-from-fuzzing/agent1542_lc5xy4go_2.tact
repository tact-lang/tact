struct DeepNest { x: Int; y: Bool; }

struct MiddleNest { inner: DeepNest; flag: Bool; }

struct OuterNest { middle: MiddleNest; text: String; }

contract DeepContract {
    val: OuterNest;

    init() {
        self.val = OuterNest{
            middle: MiddleNest{
                inner: DeepNest{ x: 1, y: false },
                flag: true
            },
            text: "hello"
        };
    }
}