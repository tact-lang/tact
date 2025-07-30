// Combination: optional struct nested in optional struct nested in optional struct
struct L1 { a: Int; }
struct L2 { b: L1?; }
struct L3 { c: L2?; }

contract ComboDeepOptional {
    store: L3?;
    init() {
        self.store = null;
    }
}
