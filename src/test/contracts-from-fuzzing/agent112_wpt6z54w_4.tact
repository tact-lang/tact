struct MultiOptionals {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract TestContract {
    mo: MultiOptionals;

    init() {
        self.mo = MultiOptionals{
            optInt: 5,
            optBool: false,
            optString: null
        };
    }
}