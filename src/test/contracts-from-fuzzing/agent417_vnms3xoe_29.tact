struct SingleOptional {
    x: Int?;
}
contract OptionalInit {
    data: SingleOptional;
    init() {
        self.data = SingleOptional{ x: null };
    }
}