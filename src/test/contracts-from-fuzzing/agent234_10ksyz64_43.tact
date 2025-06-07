trait OwnableTrait {
    owner: Address;
}

contract Example with OwnableTrait {
    owner: Address;
    init() {
        self.owner = myAddress();
    }
}