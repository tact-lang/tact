struct Params {
    s: String = "default";
}

contract OptStructField {
    val: Params;  // no initializer, should require init
    init() {
        self.val = Params{};
    }
}