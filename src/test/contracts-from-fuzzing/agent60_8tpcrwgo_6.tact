message EmptyMsg {}

contract EmptyStructEmbedded {
    data: EmptyMsg;

    init() {
        self.data = EmptyMsg{};
    }
}