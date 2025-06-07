struct HasCode {
    c: Cell;
}

contract ContractCodeStorage {
    stored: HasCode;

    init() {
        self.stored = HasCode{c: myCode()};
    }
}