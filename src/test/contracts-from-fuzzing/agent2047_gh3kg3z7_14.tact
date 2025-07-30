struct SubA {
    z: Bool;
}

struct MiddleA {
    m: Int;
    subA: SubA;
}

contract OptionalStructField {
    data: MiddleA?;

    init() {
        self.data = null;
    }
}