struct InnerData {
    text: String;
    amount: Int;
}

contract OptionalStructMixed {
    data: InnerData?;

    init() {
        self.data = InnerData{
            text: "inside",
            amount: 55
        };
    }
}
