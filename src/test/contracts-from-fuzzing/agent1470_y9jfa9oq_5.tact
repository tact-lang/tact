struct Inner {
    flag: Bool;
    count: Int;
}

contract OptStructField {
    data: Inner?;

    init() {
        self.data = Inner{
            flag: false,
            count: 5,
        };
    }
}