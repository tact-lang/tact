struct OptionalString {
    s: String?;
    num: Int?;
}

contract StringOption {
    val: OptionalString;

    init() {
        self.val = OptionalString{s:null, num:null};
    }
}