struct Params {
    name: String = "default";
    age: Int?;
}

contract TestContract {
    params: Params;

    init() {
        self.params = Params{};
    }
}