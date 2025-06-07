// Contract with multiple nested struct types, each with mixed fields
struct AddressName {
    addr: Address;
    name: String;
}

struct User {
    id: Int;
    primary: Bool;
    contact: AddressName;
}

contract UsersHolder {
    user: User;

    init() {
        self.user = User{
            id: 777,
            primary: true,
            contact: AddressName{ addr: myAddress(), name: "ton" }
        };
    }
}