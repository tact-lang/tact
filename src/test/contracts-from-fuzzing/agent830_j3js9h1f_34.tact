message(0x99999999) Msg {}

contract TestContract {
    field: Msg?;
    init() {
        self.field = Msg{};
    }
}