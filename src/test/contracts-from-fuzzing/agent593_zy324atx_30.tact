// Contract with bool stored as bit and assign invalid int value (negative for bool)
contract BoolEdge {
    flag: Bool;

    init() {
        self.flag = false;
    }
}