struct Inner {
    flag: Bool;
    count: Int;
    note: String;
}

contract TestStructField {
    data: Inner;
    init() {
        self.data = Inner{
            flag: true,
            count: 77,
            note: "inner"
        };
    }
}