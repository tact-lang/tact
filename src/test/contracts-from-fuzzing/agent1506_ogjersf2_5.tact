struct Payload {
    data: Int;
    msg: String;
}

contract TestContract {
    saved: Payload?;

    init() {
        self.saved = Payload{
            data: 123,
            msg: "abc",
        };
    }
}