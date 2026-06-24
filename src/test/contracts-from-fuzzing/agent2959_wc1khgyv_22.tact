struct BoolStrInt {
    a: Bool;
    b: String;
    c: Int;
}

contract DiffOrderFields {
    state: BoolStrInt;

    init() {
        self.state = BoolStrInt{a:true,b:"x",c:42};
    }
}