struct AddressInfo {
    line1: String;
    line2: String?;
}

struct Person {
    name: String;
    email: String?;
    address: AddressInfo?;
}

contract TestContract {
    person: Person?;

    init() {
        self.person = Person{
            name: "Dave",
            email: null,
            address: null
        };
    }

    receive() {}
}