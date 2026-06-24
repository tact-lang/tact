message(0x999) InnerMsg { x: Int; }

struct Wrapper { m: InnerMsg; data: Int; }

contract NestedMsg {
    w: Wrapper;
    init() {
        self.w = Wrapper{m: InnerMsg{x: 42}, data: 7};
    }
}