struct Leaf { v: Int; }
struct Mid { leaf: Leaf?; }
struct Top { mid: Mid?; }

contract DeepSome {
    data: Top;

    init() {
        self.data = Top{
            mid: Mid{
                leaf: Leaf{ v: 555 }
            }
        };
    }

    receive() {}
}
