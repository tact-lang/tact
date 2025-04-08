struct Params {
    name: String = "Satoshi";
    age: Int?;
    foo: Bool?;
}

contract DefaultsAndOptionals {
    params: Params;

    init() {
        self.params = Params{};
    }
}