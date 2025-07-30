struct Packed {
    s1: String;
    s2: String;
    num: Int;
}

contract PackedStructs {
    first: Packed;
    second: Packed;

    init() {
        self.first = Packed{ s1:"x", s2:"y", num:1 };
        self.second = Packed{ s1:"a", s2:"b", num:2 };
    }
}