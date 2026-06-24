struct OuterOptional {
    inner: Int;
    opt: Int?;
}

contract TestContract {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{ inner: 1, opt: null };
    }
}