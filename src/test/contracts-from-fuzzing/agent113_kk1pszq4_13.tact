struct StringHolder {
    s: String;
    optS: String?;
    n: Int;
}

contract StringContract {
    data: StringHolder;

    init() {
        self.data = StringHolder{
            s: "Hello",
            optS: null,
            n: 42
        };
    }
}