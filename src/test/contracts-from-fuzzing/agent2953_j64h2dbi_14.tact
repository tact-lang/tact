struct HasOptionalInside {
    optInt: Int?;
    optString: String?;
}

contract InitSomeNulls {
    s: HasOptionalInside;

    init() {
        self.s = HasOptionalInside{
            optInt: null,
            optString: "hi"
        };
    }
}