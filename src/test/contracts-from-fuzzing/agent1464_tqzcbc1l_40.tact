message(0x55) M55 { val: Int }

struct ContainsMessage {
    m: M55 = M55{ val: 999 };
}

contract TestContract {
    data: ContainsMessage;

    init() {
        self.data = ContainsMessage{}; // omit explicit assign
    }
}