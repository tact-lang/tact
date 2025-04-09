struct ProblemStruct {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as uint64;
}

contract ProblemContract {
    s: ProblemStruct;
    init() {
        self.s = ProblemStruct { a: 1, b: -2, c: 3, d: 4 };
    }
}