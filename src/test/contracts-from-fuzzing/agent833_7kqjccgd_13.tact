struct OptInt {
    x: Int?;
}

struct Wrapper {
    w: OptInt;
}

contract OptOverStruct {
    field: Wrapper;

    init() {
        self.field = Wrapper{
            w: OptInt{ x: null }
        };
    }
}