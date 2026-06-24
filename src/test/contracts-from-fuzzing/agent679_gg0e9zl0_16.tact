// Edge case: struct with large amount of small bool and Int? fields
struct TinyBits {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    n1: Int?;
    n2: Int?;
    n3: Int?;
    n4: Int?;
    n5: Int?;
}

contract TestContract {
    tiny: TinyBits;

    init() {
        self.tiny = TinyBits {
            b1: true,
            b2: false,
            b3: true,
            n1: null,
            n2: null,
            n3: null,
            n4: null,
            n5: null,
        };
    }
}