struct Country {
    name: String?;
}

struct AddressStruct {
    city: String?;
    country: Country;
}

struct Person {
    nickname: String?;
    address: AddressStruct?;
}

contract TestContract {
    user: Person;

    init() {
        self.user = Person{
            nickname: null,
            address: AddressStruct{ city: null, country: Country{ name: null } }
        };
    }
}