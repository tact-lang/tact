struct InnerMost { x: Int; }
struct Middle { inn: InnerMost; }
struct OuterMost { mid: Middle; }

contract DeepAgain {
    val: OuterMost;
    init() {
        self.val = OuterMost{ mid: Middle{ inn: InnerMost{ x: 5 } } };
    }
}