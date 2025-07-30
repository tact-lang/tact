// deeply nested chain, with optional at bottom
struct Leaf {
   data: Int?;
}

struct Mid1 {
    leaf: Leaf;
}

struct Mid2 {
    mid1: Mid1;
}

contract TestContract {
    top: Mid2;

    init() {
        self.top = Mid2{
            mid1: Mid1{
                leaf: Leaf{ data: null }
            }
        };
    }
}
