message(1) InnerMsg {
    foo: Int;
}

struct HasOptMsg {
    m: InnerMsg?;
    s: String;
}

contract TestContract {
    data: HasOptMsg;

    init() {
        self.data = HasOptMsg{
            m: null,
            s: "hi"
        };
    }
}