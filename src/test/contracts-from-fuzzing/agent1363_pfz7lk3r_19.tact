struct OptionInStruct {
    a: Int?;
}

contract SetToNullTest {
    data: OptionInStruct;

    init() {
        self.data = OptionInStruct{
            a: null,
        };
    }
}