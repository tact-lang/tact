struct Inner {
    x: Int?;
    y: Bool? = false;
    z: String = "hello";
}

struct Outer {
    nested: Inner?;
    count: Int = 5;
    flag: Bool?;
}

contract TestContract {
    container: Outer;

    init() {
        self.container = Outer{
            nested: null,
            count: 7,
            flag: null
        };
    }
}