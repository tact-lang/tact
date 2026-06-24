// contract with only primitives, no init
contract ZeroInitPrimitives {
    x: Int;
    y: Bool;
    z: String;
    a: Address;
    b: Cell;
    c: Slice;

    init() {
        self.x = 1;
        self.y = false;
        self.z = "hello";
        self.a = myAddress();
        self.b = emptyCell();
        self.c = emptyCell().asSlice();
    }
}
