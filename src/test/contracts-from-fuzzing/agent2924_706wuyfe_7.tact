struct Deep1 { x: Int }
struct Deep2 { x: Deep1 }
struct Deep3 { x: Deep2 }
struct Deep4 { x: Deep3 }

contract DeeplyNested {
    state: Deep4;
    init() {
        self.state = Deep4{
            x: Deep3{
                x: Deep2{
                    x: Deep1{ x: 99 }
                }
            }
        };
    }
}