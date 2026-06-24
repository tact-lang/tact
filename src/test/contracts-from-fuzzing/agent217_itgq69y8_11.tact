struct DeepStr {
    s1: String;
    s2: String?;
}

struct Container {
    inner: DeepStr;
    flag: Bool;
}

contract DeepStrings {
    data: Container;

    init() {
        self.data = Container{
            inner: DeepStr{s1: "hello", s2: null},
            flag: true,
        };
    }
}