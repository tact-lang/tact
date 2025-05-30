struct Leaf { val: Int; }
struct Mid2 { leaf: Leaf?; }
struct Mid1 { mid2: Mid2?; }
struct Top { mid1: Mid1?; }

contract DeepOptionals {
    store: Top;
    init() {
        self.store = Top{
            mid1: Mid1{
                mid2: null
            }
        };
    }
}