struct Sub {
    a: Int?;
    b: Bool;
}

struct Composite {
    x: Int;
    y: String?;
    z: Sub;
}

contract CompositeContract {
    data: Composite;

    init() {
        self.data = Composite{
            x: 1,
            y: null,
            z: Sub{a: null, b: true},
        };
    }
}