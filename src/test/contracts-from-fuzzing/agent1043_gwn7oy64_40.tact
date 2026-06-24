// Try large nested optionals with nesting level 6
struct L6 { prev: L5? }
struct L5 { prev: L4? }
struct L4 { prev: L3? }
struct L3 { prev: L2? }
struct L2 { prev: L1? }
struct L1 { val: Int? }

contract TestContract {
    data: L6;

    init() {
        self.data = L6{ prev: null };
    }
}