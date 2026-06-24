struct Inner {
    flag: Bool; 
    count: Int;
}

struct Outer {
    nested: Inner; 
    name: String;
}

contract NestedStructContract {
    data: Outer;

    init() {
        self.data = Outer{ nested: Inner{ flag: true, count: 1 }, name: "test" };
    }
}