struct Inner {
    x: Int;
    y: Int?;
}

struct Outer {
    data: Inner;
    flag: Bool;
}

contract StorageTest {
    point: Outer;
    
    init() {
        self.point = Outer{
            data: Inner{
                x: 10,
                y: null,
            },
            flag: true,
        };
    }
}