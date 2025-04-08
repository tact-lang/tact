struct EdgeCase {
    flag: Bool = false;
    small: Int as uint1 = 0; // 1-bit unsigned int
    large: Int as int257 = 0;
    text: String = "";
}

contract Test {
    e: EdgeCase;
    init() {
        self.e = EdgeCase{};
    }
}
