struct Tiny {
    b: Bool;
    i: Int as uint3;
}

contract TinyFields {
    data: Tiny;

    init() {
        self.data = Tiny{ b: true, i: 7 };
    }
}