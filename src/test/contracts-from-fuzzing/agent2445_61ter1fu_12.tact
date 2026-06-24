struct Inner {
    flag: Bool?;
    count: Int = 42;
}

struct Outer {
    label: String = "abc";
    data: Inner;
}

contract C {
    outer: Outer;

    init() {
        self.outer = Outer{
            data: Inner{
                flag: null
            }
        };
    }

    receive() {}
}