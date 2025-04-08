struct TextHolder {
    text: String;
}

contract OptionalStructVar {
    data: TextHolder?;

    init() {
        self.data = TextHolder{
            text: "sample"
        };
    }
}