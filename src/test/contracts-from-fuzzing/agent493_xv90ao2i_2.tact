struct OptionalInner {
    info: String?;
    flag: Bool?;
}

contract Opts {
    data: OptionalInner;

    init() {
        self.data = OptionalInner{
            info: null,
            flag: null
        };
    }
}