struct Params {
    name: String = "Satoshi";
    age: Int?;
}

struct User {
    p: Params;
    addr: Address;
}

contract NestedDefaults {
    val: User;

    init() {
        self.val = User{p: Params{}, addr: myAddress()};
    }
}