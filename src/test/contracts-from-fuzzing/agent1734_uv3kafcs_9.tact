struct Payload {
    p0: Int;
    p1: Int;
    p2: Bool;
    p3: String;
    p4: Cell;
    p5: Address;
    p6: Bool?;
    p7: String?;
}

contract Test {
    data: Payload?;
    init() {
        self.data = null;
    }
}