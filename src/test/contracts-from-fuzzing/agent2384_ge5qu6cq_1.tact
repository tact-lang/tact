struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract StorageTest {
    data: Outer;
    
    init() {
        self.data = Outer{
            nested: Inner{a: 5, b: true},
            flag: false,
        };
    }
}