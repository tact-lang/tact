struct BoolStruct {
    f1: Bool;
    f2: Bool?;
}

contract BoolTest {
    val: BoolStruct;

    init() {
        self.val = BoolStruct{
            f1: true,
            f2: null
        };
    }
}