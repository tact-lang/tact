contract OptSliceTest {
    data: Slice?;

    init() {
        self.data = null;
    }

    receive() {
        let _ = self.data;
    }
}