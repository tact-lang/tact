struct L3 {
    val: Int;
}

struct L2 {
    deep: L3?;
}

struct L1 {
    mid: L2?;
}

contract TestContract {
    data: L1?;

    init() {
        self.data = null;
    }
}