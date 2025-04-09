struct Nested {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract TestContract {
    nest: Nested;

    init() {
        self.nest = Nested{
            optInt: null,
            optBool: null,
            optString: null
        };
    }
}