struct Sub {
    b: Bool = false;
    s: String = "";
}

contract DefaultNestedFieldsContract {
    param: Sub;

    init() {
        self.param = Sub{};
    }
}
