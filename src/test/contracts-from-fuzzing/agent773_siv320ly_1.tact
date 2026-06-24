struct Wrapper {
    nested: Int?;
    flag: Bool;
}

contract OptionalsInStruct {
    wrapping: Wrapper;

    init() {
        self.wrapping = Wrapper{
            nested: null,
            flag: false,
        };
    }
}