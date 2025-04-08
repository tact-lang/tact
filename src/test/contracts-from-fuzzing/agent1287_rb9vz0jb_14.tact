// Deep optionals with nested structs containing optionals
struct OptInner {
    a: Int?;
    b: Bool?;
}

struct OptOuter {
    inner: OptInner?;
    flag: Bool;
}

contract TestContract {
    optData: OptOuter;

    init() {
        self.optData = OptOuter{
            inner: null,
            flag: true,
        };
    }
}