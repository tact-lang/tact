struct Data {
    a: Int;
    b: Bool;
    c: String;
}

contract AssignNullStruct {
    d: Data?;

    init() {
        self.d = null;
    }
}