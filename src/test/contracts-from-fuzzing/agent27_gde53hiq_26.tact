contract TestContract {
    data: Slice;

    init() {
        self.data = "hello".asSlice();
    }
}