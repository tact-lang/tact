struct A { x: Int }
message Empty{}

contract StructAndMessage {
    s: A;
    m: Empty;

    init() {
        self.s = A{ x:5 };
        self.m = Empty{};
    }
}