struct Data1 {
    x: Int;
}

struct Data2 {
    y: Bool?;
}

struct Data3 {
    s: String;
    z: Int?;
}

contract Test {
    d1: Data1?;
    d2: Data2?;
    d3: Data3?;

    init() {
        self.d1 = null;
        self.d2 = null;
        self.d3 = null;
    }
}