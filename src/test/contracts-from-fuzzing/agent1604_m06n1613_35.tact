struct DefInt {
    x: Int = 7;
}

struct UseDefInt {
    field: DefInt;
}

contract DefaultStructValue {
    f: UseDefInt;

    init() {
        self.f = UseDefInt{ field: DefInt{} };
    }

    receive() {}
}