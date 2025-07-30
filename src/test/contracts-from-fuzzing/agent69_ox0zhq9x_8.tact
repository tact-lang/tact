struct Params {
    age: Int?;
    name: String = "unknown";
    comment: String?;
}

contract DefaultsAndOptionals {
    data: Params;

    init() {
        self.data = Params{
            age: null,
            comment: null,
        };
    }
}
