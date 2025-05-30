struct StructBoolInt {
    b: Bool;
    i: Int;
}

contract TestContract {
    x: StructBoolInt;

    init() {
        self.x = StructBoolInt{
            b: false,
            i: 512
        };
    }
}