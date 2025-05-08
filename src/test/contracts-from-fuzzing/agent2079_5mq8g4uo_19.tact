// deeply nested optional in fields
struct L1 {x:Int?}
struct L2 {y:L1?}
struct L3 {z:L2?}

contract TestContract {
    deep: L3;
    init() {
        self.deep = L3{z: L2{ y: L1{ x:null } }};
    }
}