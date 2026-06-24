struct DeepNested {
    child: Container;
    note: String;
}

struct Container {
    num: Int;
    flag: Bool;
    msg: String;
}

contract TestContract {
    storage: DeepNested;

    init() {
        self.storage = DeepNested{
            child: Container{
                num: 10,
                flag: false,
                msg: "hello"
            },
            note: "done"
        };
    }
}