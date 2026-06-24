struct InnerData {
    number: Int;
    flag: Bool;
}

contract OptionalInnerData {
    content: InnerData?;

    init() {
        self.content = InnerData{
            number: 55,
            flag: true,
        };
    }
}