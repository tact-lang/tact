message(17) InnerMsg {
    x: Int;
}

message(18) OuterMsg {
    inner: InnerMsg?;
    flag: Bool = false;
}

struct Wrapper {
    outer: OuterMsg? = null;
    count: Int = 0;
    text: String = "test";
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{};
    }
}