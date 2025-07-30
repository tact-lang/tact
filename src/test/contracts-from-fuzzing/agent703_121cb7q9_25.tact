struct Wrapper {
    payload: Slice;
}

contract TestContract {
    data: Wrapper;
    init() {
        self.data = Wrapper{
            payload: emptyCell().asSlice()
        };
    }
}