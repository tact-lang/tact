struct Inner {
    data: Int;
}

struct Outer {
    value: Int;
    nested: Inner;
}

contract TestContract {
    myData: Outer;

    init() {
        self.myData = Outer{
            value: 10,
            nested: Inner{
                data: 20
            }
        };
    }
}