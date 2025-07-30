struct Mid {
    a: Int?;
    b: Bool?;
}

struct Outer {
    x: Mid?;
    y: String?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            x: null,
            y: null
        };
    }

    receive() {
        let _ = self.data.x;
    }
}