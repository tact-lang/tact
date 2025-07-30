struct DefaultInner {
    x: Int = 9;
}

struct Wrapper {
    inner: DefaultInner;
    z: Int;
}

contract DefaultsNested {
    data: Wrapper;

    init() {
        self.data = Wrapper{ inner: DefaultInner{}, z:7 };
    }

    receive() {
        let _ = self.data;
    }
}