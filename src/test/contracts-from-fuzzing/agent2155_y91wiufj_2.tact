struct Deep {
    x: Int;
    y: Bool;
}

struct Wrapper {
    inner: Deep;
    flag: Bool;
}

contract TestContract {
    data: Wrapper;
    
    init() {
        self.data = Wrapper{ inner: Deep{ x: 1, y: false }, flag: true };
    }
}