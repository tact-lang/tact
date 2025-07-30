struct StrStruct {
    a: String;
    b: String;
    c: String;
}

contract BigStrsInState {
    s: StrStruct;

    init() {
        self.s = StrStruct{ a:"one", b:"two", c:"three" };
    }
}