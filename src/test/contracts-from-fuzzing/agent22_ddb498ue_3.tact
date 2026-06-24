struct Inner {
    flag: Bool;
    message: String;
}

struct Outer {
    count: Int;
    innerStruct: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            count: 42,
            innerStruct: Inner{
                flag: true,
                message: "hello"
            }
        };
    }
}
