struct OptionalInner {
    a: Int?;
    b: Bool?;
}

struct Container {
    x: OptionalInner;
    y: OptionalInner?;
}

contract OptionalNested {
    data: Container;

    init() {
        self.data = Container{
            x: OptionalInner{a:null, b:true},
            y: null
        };
    }
}