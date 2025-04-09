// Using multiple levels of nesting with structs and optionals inside contract persistent field

struct L1 { a: Int; b: Bool; }
struct L2 { l1: L1; s: String; }
struct L3 { l2: L2?; flag: Bool; }

contract TestContract {
    nested: L3;

    init() {
        self.nested = L3{ l2: null, flag: true };
    }
}