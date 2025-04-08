struct MaxBitsInt {
    big: Int as int257;
}

contract Test {
    data: MaxBitsInt;

    init() {
        self.data = MaxBitsInt{big: 0};
    }
}