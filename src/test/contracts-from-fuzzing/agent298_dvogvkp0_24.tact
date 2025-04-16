struct EmptyOptField {
    x: Int?;
}

contract OptNullInit {
    f: EmptyOptField;
    init() {
        self.f = EmptyOptField{ x: null };
    }
}