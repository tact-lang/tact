struct OptionalStuff {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    val: OptionalStuff;

    init() {
        self.val = OptionalStuff{
            x: null,
            y: true,
            z: null
        };
    }
}