struct RepeatedDefault {
    x: Int = 1;
    y: Int = 2;
    z: Int = 3;
}

contract DefaultsInit {
    f: RepeatedDefault;
    init() {
        self.f = RepeatedDefault{};
    }
}