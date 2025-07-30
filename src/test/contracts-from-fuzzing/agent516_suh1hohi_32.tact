struct StringHolder {
    s: String;
    n: Int;
}

contract StringStorage {
    data: StringHolder;

    init() {
        self.data = StringHolder{
            s: "hello world",
            n: 10
        };
    }
}
