struct NullableSlices {
    sl1: Slice?;
    sl2: Slice?;
    sl3: Slice?;
}

contract NullableSlicesTest {
    data: NullableSlices;

    init() {
        self.data = NullableSlices{};
    }
}