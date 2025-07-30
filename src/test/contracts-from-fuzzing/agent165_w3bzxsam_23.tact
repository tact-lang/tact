struct OnlyOpt { a: Int?; b: Bool?; c: String? }

contract AllOptional {
    val: OnlyOpt;

    init() {
        self.val = OnlyOpt{ a: null, b: true, c: null };
    }
}