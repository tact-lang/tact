struct Account {
    balance: Int as coins;
    nonce: Int as uint32;
}

struct State {
    owner: Address;
    acc: Account;
}

contract TestContract {
    st: State;

    init() {
        self.st = State{
            owner: myAddress(),
            acc: Account{
                balance: ton("1"),
                nonce: 123,
            },
        };
    }
}