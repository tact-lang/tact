// Nested optional struct inside optional struct inside contract
struct L2 {
    val: Int?;
}

struct L1 {
    l2: L2?;
}

contract TestContract {
    s: L1?;

    init() {
        self.s = L1 {
            l2: L2 {
                val: null
            }
        };
    }
}