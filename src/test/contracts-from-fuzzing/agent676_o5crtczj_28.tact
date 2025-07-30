message(42) HelloMsg {
    txt: String;
}

struct MyData {
    a: Int = 0;
    b: Bool? = null;
    c: HelloMsg? = null;
    d: String = "hi";
}

contract TestContract {
    state: MyData;

    init() {
        self.state = MyData{};
    }
}