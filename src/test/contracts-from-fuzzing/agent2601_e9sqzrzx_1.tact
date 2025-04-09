struct Deep {
    a: Int;
    b: Bool?;
    c: String;
}

struct Wrapper {
    inner: Deep;
    flag: Bool;
}

contract TestContract {
    data: Wrapper;
    
    init() {
        self.data = Wrapper{ inner: Deep{ a: 42, b: null, c: "x" }, flag: false };
    }
}