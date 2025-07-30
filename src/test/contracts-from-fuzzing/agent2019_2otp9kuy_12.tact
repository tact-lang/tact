// Chain of nested structs with many optional levels
struct L3 { x: Int?; y: String?; }
struct L2 { l3: L3; f: Bool; }
struct L1 { l2: L2; addr: Address; }

contract DeepOptionals {
    nested: L1;
    init() {
        self.nested = L1{
            l2: L2{
                l3: L3{ x: null, y: null },
                f: true
            },
            addr: myAddress()
        };
    }
}