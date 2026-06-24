// optional Address field in persistent contract state
contract TestContract {
    addr: Address?;

    init() {
        self.addr = null;
    }
}