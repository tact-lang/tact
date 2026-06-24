// Maximal optional layering: optional struct inside optional struct inside optional struct
struct L3 { value: Int; }
struct L2 { val: L3?; }
struct L1 { val: L2?; }

contract LayeredNestedOption {
    data: L1;

    init() {
        self.data = L1{ val: null };
    }
}