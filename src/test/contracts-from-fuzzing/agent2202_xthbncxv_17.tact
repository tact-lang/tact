struct DeeplyOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract OptContainer {
    val: DeeplyOptional?;

    init() {
        self.val = null;
    }
}