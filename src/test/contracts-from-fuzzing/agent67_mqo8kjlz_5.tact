struct OptionalStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Outer {
    inner: OptionalStruct?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null
        };
    }
}