struct Inner {
    a: Int?; 
    b: Bool?; 
}

struct Outer {
    x: Int?;
    y: Inner?;
    z: String?;
}

contract DeepOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            x: null,
            y: null,
            z: null
        };
    }
}