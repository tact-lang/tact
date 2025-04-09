struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptionalStructField {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            a: null,
            b: null,
            c: "hello",
            d: null
        };
    }

    receive() {
        if (self.data.a == null) {
            self.data.a = 1;
        } else {
            self.data.a = self.data.a!! + 1;
        }
    }
}