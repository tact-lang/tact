struct OptionalHolder {
    a: Int?;
    b: Bool?;
    c: Cell?;
}

contract OptionalStorage {
    data: OptionalHolder;

    init() {
        self.data = OptionalHolder{a: null, b: null, c: null};
    }
}