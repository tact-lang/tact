struct Deep {
    a: Int;
    b: Layer?;
}

struct Layer {
    x: Int;
    y: Layer2?;
}

struct Layer2 {
    flag: Bool;
}

contract TestContract {
    data: Deep;

    init() {
        self.data = Deep{
            a: 1,
            b: null,
        };
    }
}