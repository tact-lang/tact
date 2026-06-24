struct Pos {
    x: Int;
    y: Int;
}

struct Meta {
    flag: Bool;
    owner: Address;
}

struct Complex {
    pos: Pos;
    meta: Meta;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            pos: Pos{ x: 1, y: 2 },
            meta: Meta{ flag: true, owner: myAddress() }
        };
    }
}