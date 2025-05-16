struct Data {
    value: Int?;
}

contract TestOptionalGetter {
    data: Data;

    init() {
        self.data = Data { value: null };
    }

    receive() {}

    get fun getOptional(): Int? {
        return self.data.value;
    }
}
