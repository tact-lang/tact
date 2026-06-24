// Check optional in struct with only optional string with value
struct StringOpt {
    s: String?;
}

contract StringOptContract {
    val: StringOpt;

    init() {
        self.val = StringOpt{ s: "abc" };
    }
}