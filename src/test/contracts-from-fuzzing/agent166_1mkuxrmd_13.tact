struct RemainStruct {
    data: Slice as remaining;
}

contract TestContract {
    val: RemainStruct;

    init() {
        self.val = RemainStruct{
            data: emptyCell().asSlice(),
        };
    }
}