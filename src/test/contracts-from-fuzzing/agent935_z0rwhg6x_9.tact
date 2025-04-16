struct Params {
    name: String;
    age: Int?;
}

contract TestContract {
    params: Params;

    init() {
        self.params = Params{ name: "Alice" };
    }
}