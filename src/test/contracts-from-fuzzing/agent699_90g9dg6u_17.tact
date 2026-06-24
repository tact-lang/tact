struct Wrap { field: Int; opt: String?; }

contract OptInit {
    w: Wrap;
    init() {
        self.w = Wrap{ field: 10, opt: null };
    }
}