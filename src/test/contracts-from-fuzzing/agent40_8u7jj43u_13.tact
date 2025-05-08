struct OptionalInner {
    value: Int?;
    name: String?;
}

struct Container {
    x: OptionalInner;
    y: OptionalInner?;
}

contract TestOptInner {
    data: Container;

    init() {
        self.data = Container{
            x: OptionalInner{value:null, name:null},
            y: null
        };
    }

    receive() {
        let tmp = self.data;
    }
}