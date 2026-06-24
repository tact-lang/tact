struct Details {
    city: String?;
    country: String?;
    phone: String?;
    age: Int?;
}

contract TestContract {
    details: Details;

    init() {
        self.details = Details{
            city: "City",
            country: "Country",
            phone: "123",
            age: 55
        };
    }
}
