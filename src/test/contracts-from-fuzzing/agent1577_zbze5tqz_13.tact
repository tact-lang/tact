message(42) InnerMessage {
    text: String;
    enabled: Bool?;
}

struct Container {
    count: Int;
    imsg: InnerMessage;
}

contract TestContract {
    data: Container;
    init() {
        self.data = Container{
            count: 9,
            imsg: InnerMessage{ text: "embedded", enabled: null }
        };
    }
}