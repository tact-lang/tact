struct VirtuallyEmpty { val: Int; }

contract OptVirtuallyEmpty {
    piece: VirtuallyEmpty?;

    init() {
        self.piece = null;
    }

    receive() {
        self.piece = VirtuallyEmpty{ val: 1 };
    }
}