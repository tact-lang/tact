struct NestedInner {
    a: Int = 10;
    b: Bool?;
    c: String = "hi";
}

struct Outer {
    x: Int;
    y: NestedInner;
}

contract TestContract {
    myData: Outer;

    init() {
        self.myData = Outer{
            x: 999,
            y: NestedInner{
                b: null,
            },
        };
    }
}