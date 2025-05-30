struct Sub {
    x: Int;
    y: Int?;
}

contract DefaultStructValue {
    s: Sub = Sub { x: 7, y: null };

    init() {
        self.s = Sub { x: 3, y: null };
    }
}