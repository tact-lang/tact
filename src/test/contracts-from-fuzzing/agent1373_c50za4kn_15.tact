struct Deep { leaf: Int; }

struct Mid { deep: Deep?; }

struct Higher { mid: Mid?; }

contract Test {
    state: Higher?;

    init() {
        self.state = Higher{
            mid: Mid{
                deep: Deep{
                    leaf: 42
                }
            }
        };
    }
}