struct OptionalStructField {
    flag: Bool;
    memo: String?;
}

contract OptionalStructFieldContract {
    content: OptionalStructField;

    init() {
        self.content = OptionalStructField{
            flag: false,
            memo: null,
        };
    }

    receive() {
        if (self.content.memo == null) {
            self.content = OptionalStructField{
                flag: true,
                memo: "set",
            };
        }
    }
}