struct Data {
    payload: Slice? = null;
    flag: Bool = false;
}

contract OptionalSliceDefault {
    data: Data;

    init() {
        self.data = Data{};
    }
}