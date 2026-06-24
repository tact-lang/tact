struct Mixed {
    flag: Bool;
    count: Int as uint5;
    message: String;
}

contract StructWithSizes {
    m: Mixed = Mixed{ flag: true, count: 17, message: "hi" };

    init() {
        self.m = Mixed{ flag: false, count: 3, message: "bye" };
    }

    receive() {}
}