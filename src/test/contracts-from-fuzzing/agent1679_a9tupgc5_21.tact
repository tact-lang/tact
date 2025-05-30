struct Problem {
    a: Int = 1;
    b: Bool = true;
}

contract ChangeStructFieldType {
    s: Problem;

    init() {
        self.s = Problem{};
    }

    receive() {}
}