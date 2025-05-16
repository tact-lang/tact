struct Params {
    id: Int;
    name: String;
    active: Bool;
    description: String?;
}

contract TestWrapper {
    params: Params;

    init() {
        self.params = Params{
            id: 5,
            name: "alpha",
            active: true,
            description: null,
        };
    }
}