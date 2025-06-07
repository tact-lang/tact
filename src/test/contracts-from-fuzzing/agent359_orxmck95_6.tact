struct DeepOpt {
    val: Bool?;
    msg: String;
}

struct Container {
    nest: DeepOpt;
    num: Int;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{ nest: DeepOpt{ val: null, msg: "hello" }, num: 42 };
    }
}