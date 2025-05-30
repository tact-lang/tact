struct Inner {
    flag: Bool?;  // optional bool
    num: Int?;   // optional int
}

contract TestContract {
    data: Inner = Inner{};  // defaults to null optionals
    init() {
        self.data = Inner{
            flag: true,
            num: 10
        };
    }
}