struct MixedOptional {
    a: Int?;
    b: Bool;
    c: String?;
}

contract MixedOptionalTest {
    data: MixedOptional;

    init() {
        self.data = MixedOptional{ a: null, b: true, c: null };
    }
}