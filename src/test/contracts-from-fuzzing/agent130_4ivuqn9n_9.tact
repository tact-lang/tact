struct EmptyOpt {
    x: Int?;
}

contract OptionalDefaults {
    f: EmptyOpt = EmptyOpt{ x: null };
    receive() {
        self.f = self.f;
    }
}