// Deep nested optionals inside struct fields
struct X {
    a: Int?;
    b: String?;
}

struct Y {
    inner: X?;
    flag: Bool;
}

contract TestContract {
    data: Y;

    init() {
        self.data = Y{ inner: null, flag: false };
    }

    receive() {
        self.data = Y{ inner: X{ a: 1, b: "x" }, flag: true };
    }
}