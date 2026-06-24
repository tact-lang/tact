struct L1 {
    val: Int?;
}
struct L2 {
    inner: L1?;
}
struct L3 {
    inner: L2?;
}

contract TestContract {
    s: L3;
    init() {
        self.s = L3{
            inner: L2{
                inner: L1{
                    val: null
                }
            }
        };
    }
}