struct S1 {
    a: Int;
}

struct OptContainer {
    s: S1?;
    b: Bool;
}

contract NullableStructInContract {
    data: OptContainer;

    init() {
        self.data = OptContainer{
            s: null,
            b: true,
        };
    }
}