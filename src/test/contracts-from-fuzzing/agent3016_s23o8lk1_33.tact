struct MaxMinInts {
    maxVal: Int = 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    minVal: Int = -0x8000000000000000000000000000000000000000000000000000000000000000;
}

contract TestContract {
    data: MaxMinInts;

    init() {
        self.data = MaxMinInts{};
    }
}