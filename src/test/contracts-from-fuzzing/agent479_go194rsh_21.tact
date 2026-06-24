struct InnerMost { v: Int }
struct L2 { v: InnerMost }
struct L3 { v: L2 }
struct L4 { v: L3 }

contract OptionalDeepStruct {
    x: L4?;

    init() {
        self.x = null;
    }
}