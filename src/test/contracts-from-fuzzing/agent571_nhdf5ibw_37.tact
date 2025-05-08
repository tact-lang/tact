struct Nested {
    val: Int;
    info: String;
}

struct Complex {
    id: Int;
    active: Bool;
    name: String;
    owner: Address;
    meta: Nested?;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            id: 1,
            active: true,
            name: "Test",
            owner: myAddress(),
            meta: null
        };
    }
}