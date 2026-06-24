struct Sub {
    x: Int;
}

struct Cont {
    y: Sub?;
}

contract NullableStructHolder {
    d: Cont;

    init() {
        self.d = Cont{
            y: null,
        };
    }
}