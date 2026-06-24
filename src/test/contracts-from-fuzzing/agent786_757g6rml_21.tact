struct OnlyOptInt {
    a: Int?;
}

contract DefaultNullOpt {
    f: OnlyOptInt;

    init() {
        self.f = OnlyOptInt{};
    }
}