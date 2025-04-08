struct InnerBool {
    flag: Bool;
}

struct MiddleBool {
    ib: InnerBool;
}

struct OuterBool {
    mb: MiddleBool;
}

contract DeepBoolTest {
    payload: OuterBool;

    init() {
        self.payload = OuterBool{ mb: MiddleBool{ ib: InnerBool{ flag: true } } };
    }
}
