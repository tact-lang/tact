// Use struct with String default value
struct WithStr {
    s: String = "hello";
    i: Int = 5;
}

contract StrStructDefault {
    data: WithStr;

    init() {
        self.data = WithStr{};
    }
}