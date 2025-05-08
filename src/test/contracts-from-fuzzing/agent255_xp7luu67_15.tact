// deeply nested optional struct
struct L3 { val: Int; }
struct L2 { l3: L3?; }
struct L1 { l2: L2?; }

contract TestContract {
    obj: L1?;

    init() {
        self.obj = L1{
            l2: L2{
                l3: null
            }
        };
    }
}