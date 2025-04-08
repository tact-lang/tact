struct InnerX {
    val: Int;
}

contract StructFieldDirect {
    data: InnerX;

    init() {
        self.data = InnerX{ val: 99 };
    }
}