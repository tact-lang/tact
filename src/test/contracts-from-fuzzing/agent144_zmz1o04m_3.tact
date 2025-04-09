struct AddressData {
    street: String;
    city: String;
    postcode: String?;
}

struct ComplexProfile {
    username: String;
    age: Int?;
    isActive: Bool;
    address: AddressData;
    description: String?;
}

contract NestedStructTest {
    profile: ComplexProfile;

    init() {
        self.profile = ComplexProfile{
            username: "",
            age: null,
            isActive: true,
            address: AddressData{
                street: "",
                city: "",
                postcode: null,
            },
            description: null,
        };
    }
}