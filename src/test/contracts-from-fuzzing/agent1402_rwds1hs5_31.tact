struct ContainsSlices {
    s: Slice;
    so: Slice?;
}

contract SlicesTest {
    a: ContainsSlices;

    init() {
        self.a = ContainsSlices{ s: emptyCell().asSlice(), so: null };
    }
}