// optional struct wrapping optional struct wrapping optional Int
struct L3 { val: Int?; }
struct L2 { l3: L3?; }
struct L1 { l2: L2?; }

contract MultiOptWrap {
    wrap: L1;

    init() {
        self.wrap = L1{l2: null};
    }
}