struct MaybeEmpty2 {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    m2: MaybeEmpty2;

    init() {
        self.m2 = MaybeEmpty2{ x: null, y: null };
    }
}
