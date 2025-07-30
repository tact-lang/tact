struct Sub {
    name: String;
}

struct Outer {
    inner: Sub?; 
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null
        };
    }
}