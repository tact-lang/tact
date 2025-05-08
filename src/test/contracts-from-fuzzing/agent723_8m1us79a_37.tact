struct L3 { val: Int?; }
struct L2 { val: L3?; }
struct L1 { val: L2?; }

contract TestContract {
    s: L1;

    init() {
        self.s = L1{
            val: L2{
                val: L3{
                    val: 123,
                }
            }
        };
    }

    receive() {}
}