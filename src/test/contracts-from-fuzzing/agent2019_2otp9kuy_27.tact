// Struct containing optional Cell/Slice
struct OptCS {
    c: Cell?;
    s: Slice?;
}

contract WrapOptCS {
    data: OptCS;
    init() {
        self.data = OptCS{c:null,s:null};
    }
}