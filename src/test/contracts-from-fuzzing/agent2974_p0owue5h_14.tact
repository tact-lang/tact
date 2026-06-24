// diverse scalars including String and slices
contract ScalarContract {
    num: Int;
    flag: Bool;
    text: String;
    data: Cell;
    segm: Slice;

    init() {
        self.num = 1;
        self.flag = false;
        self.text = "hi";
        self.data = emptyCell();
        self.segm = emptyCell().asSlice();
    }
}