message(1) InnerMessage { b: Bool }
message(2) OuterMessage { inner: InnerMessage; txt: String }

contract TestContract {
    data: OuterMessage;

    init() {
        self.data = OuterMessage{
            inner: InnerMessage{ b: true },
            txt: "check"
        };
    }

    receive() {}
}