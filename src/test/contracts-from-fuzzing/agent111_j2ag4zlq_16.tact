struct EmptyOptionalVals {
    x: Int?;
}
contract EmptyInitOptionals {
    f: EmptyOptionalVals;
    init() {
        self.f = EmptyOptionalVals{ x: null };
    }
}