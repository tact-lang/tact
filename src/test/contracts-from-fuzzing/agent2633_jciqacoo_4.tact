struct OptStruct {
    x: Int;
}

contract OptInStorage {
    data: OptStruct?;

    init() {
        self.data = null;
    }
}
