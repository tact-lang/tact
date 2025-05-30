contract TestContract {
    mySlice: Slice? = null;

    init() {
        self.mySlice = emptyCell().asSlice();
    }
}