struct TextHolder {
    txt1: String;
    txt2: String;
    txt3: String;
}

contract StringStorage {
    data: TextHolder;

    init() {
        self.data = TextHolder{
            txt1: "Hello",
            txt2: "world",
            txt3: "!!!"
        };
    }
}