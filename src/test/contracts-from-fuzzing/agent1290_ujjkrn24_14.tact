struct Leaf { val: Int; }
struct Mid2 { leaf: Leaf?; }
struct Mid1 { mid2: Mid2?; }
struct Top { mid1: Mid1?; }

contract DeepSome {
    store: Top;
    init() {
        self.store = Top{
            mid1: Mid1{
                mid2: Mid2{
                    leaf: Leaf{ val: 17 }
                }
            }
        };
    }
}