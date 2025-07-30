// testing many nested levels with optional overflow
struct L1 { x: Int }
struct L2 { x: L1? }
struct L3 { x: L2? }
struct L4 { x: L3? }
struct L5 { x: L4? }
struct L6 { x: L5? }
struct L7 { x: L6? }
struct L8 { x: L7? }

contract DeepOptionalChain {
    data: L8;

    init() {
        self.data = L8{ x: null };
    }
}