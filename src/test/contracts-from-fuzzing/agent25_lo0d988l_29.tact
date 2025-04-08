// Contract with a field as address
contract TestContract {
    owner: Address;

    init() {
        self.owner = myAddress();
    }
}