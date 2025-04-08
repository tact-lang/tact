struct SOptional {
    val: Int?;
}

contract OptFieldNoInit {
    data: SOptional;
    init() {
        self.data = SOptional{};
    }
}
