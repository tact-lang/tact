struct Nestedopt {
    f: Inner?;
}

struct Inner {
    x: Int;
    y: Bool?;
}

contract TestContract {
    data: Nestedopt;

    init() {
        self.data = Nestedopt{
            f: Inner{ x: 7, y: null }
        };
    }
}