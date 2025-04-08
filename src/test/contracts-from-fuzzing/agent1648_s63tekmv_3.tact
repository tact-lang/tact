struct OptionalStruct {
    x: Int?;
    y: Int?;
    z: Int?;
}

struct Container {
    inner: OptionalStruct?;
}

contract TestContract {
    data: Container;
    
    init() {
        self.data = Container {
            inner: OptionalStruct {
                x: 1,
                y: null,
                z: 3
            }
        };
    }
}