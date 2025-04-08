struct OptionalInner {
    value: Int?;
    name: String;
}

contract OptionalStructField {
    data: OptionalInner;

    init() {
        self.data = OptionalInner{
            value: null,
            name: "hi"
        };
    }

    receive() {
        let _ = self.data;
    }
}