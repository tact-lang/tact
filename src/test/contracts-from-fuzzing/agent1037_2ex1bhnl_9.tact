struct StrLong {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract TestContract {
    data: StrLong;

    init() {
        self.data = StrLong{
            s1: "a",
            s2: "b",
            s3: "c",
            s4: "d"
        };
    }
}