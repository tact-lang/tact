struct L5 { v: Int?; }
struct L4 { next: L5?; }
struct L3 { next: L4?; }
struct L2 { next: L3?; }
struct L1 { next: L2?; }

contract DeepNestedOptional {
    info: L1;
    init() {
        self.info = L1{
            next: L2{
                next: null
            }
        };
    }
}