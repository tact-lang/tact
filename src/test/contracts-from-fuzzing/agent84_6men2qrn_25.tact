struct SDefault {
    a: Int = 7;
}

contract ConstStruct {
    data: SDefault;

    init() {
        self.data = SDefault{};
    }
}