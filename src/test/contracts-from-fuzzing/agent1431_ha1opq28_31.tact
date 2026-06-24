struct Base {
    x: Int = 1;
    y: Bool = false;
}

struct L2 {
    inner: Base?;
}

struct L3 {
    l2: L2?;
}

struct L4 {
    l3: L3?;
}

contract TestContract {
    val: L4?;

    init() {
        self.val = L4{
            l3: L3{
                l2: L2{
                    inner: null
                }
            }
        };
    }
}