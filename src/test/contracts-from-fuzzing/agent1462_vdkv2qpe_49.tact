struct L3 { foo: Int?; bar: Bool?; }
struct L2 { l3: L3?; }
struct L1 { l2: L2?; }

contract ChainOfOptionals {
    nested: L1?;
    
    init() {
        self.nested = null;
    }
}