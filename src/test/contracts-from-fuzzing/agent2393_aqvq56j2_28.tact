struct ManyOptionKind {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract ManyKinds {
    vals: ManyOptionKind = ManyOptionKind{ optInt: null, optBool: null, optString: null };
}