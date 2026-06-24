struct Inner {
    nestedMap: map<Address, Int>;
}

contract TestContract {
    nested: Inner?;

    init() {
        self.nested = null;
    }
}