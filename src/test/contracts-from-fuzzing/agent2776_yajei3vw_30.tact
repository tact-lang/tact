struct Mid {
    optInt: Int?;
    optBool: Bool?;
}

struct Top {
    inner: Mid;
}

contract TopContract {
    top: Top;

    init() {
        self.top = Top{ inner: Mid{ optInt: null, optBool: null } };
    }
}
