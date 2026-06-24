struct Inner {
    flag: Bool;
    content: String;
}

contract DeepOptional {
    info: Inner?;
    data: Int = 1;

    init() {
        self.data = 2;
    }
}