struct Sopt {
    s: String?;
}

contract OptionalStructDefault {
    f: Sopt;

    init() {
        self.f = Sopt{ s: null };
    }
}