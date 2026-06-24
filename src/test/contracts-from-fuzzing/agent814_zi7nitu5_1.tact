struct Inner {
    x: Int;
    y: Int?;
}

struct Outer {
    id: Int;
    payload: Inner;
}

contract TestContract {
    data: Outer;
    
    init() {
        self.data = Outer{
            id: 1,
            payload: Inner{ x: 0, y: null }
        };
    }
}