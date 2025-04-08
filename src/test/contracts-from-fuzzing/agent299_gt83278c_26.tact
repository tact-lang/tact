struct Optionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    data: Optionals;

    init() {
        self.data = Optionals{
            x: null,
            y: null,
            z: null
        };
    }
}