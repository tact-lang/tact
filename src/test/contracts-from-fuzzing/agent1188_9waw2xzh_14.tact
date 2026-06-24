struct TextHolder {
    name: String;
    description: String;
}

contract StringsInStorage {
    data: TextHolder;

    init() {
        self.data = TextHolder{
            name: "hello",
            description: "world"
        };
    }
}