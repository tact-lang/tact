message(777) EventMsg {
    label: String;
}

struct WithOptMsg {
    event: EventMsg?;
    amount: Int;
}

contract EmbedOptMsg {
    state: WithOptMsg;

    init() {
        self.state = WithOptMsg{ event: null, amount: 100 };
    }
}