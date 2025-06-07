struct OptionalStringHolder {
    str: String?;
}

contract OptStringFieldTest {
    data: OptionalStringHolder;
    init() {
        self.data = OptionalStringHolder{
            str: null,
        };
    }
}
