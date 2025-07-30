struct Params {
    name: String = "Alice";
    age: Int?;
    flag: Bool?;
}

contract TestContract {
    params: Params;

    init() {
        self.params = Params{
            age: 30,
            flag: null
        };
    }
}