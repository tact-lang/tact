struct Inner {
    x: Int as uint5;
    y: Int?; 
}

struct Container {
    id: Int as uint8;
    flag: Bool;
    payload: Inner?;
}

contract TestContract {
    state: Container;

    init() {
        self.state = Container{
            id: 255,
            flag: true,
            payload: Inner{ x: 17, y: null }
        };
    }
}