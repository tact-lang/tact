struct OptString {
    name: String?;
    value: Int?;
}

contract OptStringContract {
    data: OptString;

    init() {
        self.data = OptString{
            name: null,
            value: null,
        };
    }
}