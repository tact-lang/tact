message(0x20) DetailMsg {
    n: Int;
}

struct OuterContainer {
    payload: DetailMsg;
    text: String;
}

contract OptionalContainerMsg {
    data: OuterContainer? = null;

    init() {
        self.data = OuterContainer{
            payload: DetailMsg{ n: 77 },
            text: "payload"
        };
    }
}