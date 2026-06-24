// optional slice in contract persistent storage
contract TestContract {
    optSlice: Slice?;
    init() {
        self.optSlice = null;
    }
}