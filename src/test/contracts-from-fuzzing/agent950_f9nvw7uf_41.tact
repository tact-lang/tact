// explicit test: nested optional chain inside contract field
struct L1 { l2: L2?; s: String?; }
struct L2 { l3: L3?; b: Bool?; }
struct L3 { foo: Int?; }

contract FieldBigChain {
    top: L1?;

    init() {
        self.top = null;
    }
}