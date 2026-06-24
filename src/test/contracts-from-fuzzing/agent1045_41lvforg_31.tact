struct Inner {
    x: Int;
}

struct Middle {
    inn: Inner?;
}

struct Outer {
    mid: Middle?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ mid: null };
    }
}