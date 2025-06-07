struct Wrapper {
    innerInt: Int;
    innerOpt: Int?;
}

contract DefaultsAndOptionals {
    data: Wrapper;

    init() {
        self.data = Wrapper{ innerInt: 42, innerOpt: null };
    }
}