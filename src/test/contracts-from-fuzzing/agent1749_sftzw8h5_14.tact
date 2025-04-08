struct Flagged {
    enabled: Bool = true;
    comment: String = "hello";
}

contract DefaultsInStructs {
    val: Flagged;

    init() {
        self.val = Flagged{};
    }
}