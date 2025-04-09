message(0x1010) EventData {
    id: Int;
    sender: Address;
    note: String?;
}

struct Wrapper {
    event: EventData?;
    success: Bool;
}

contract TestContract {
    wrapper: Wrapper = Wrapper{
        event: null,
        success: true,
    };

    init() {}

    receive() {}
}