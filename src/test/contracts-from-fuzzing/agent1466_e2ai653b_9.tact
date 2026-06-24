struct NestedString {
    txt: String;
    num: Int;
}

struct Container {
    struc: NestedString;
    flag: Bool;
    count: Int;
}

contract StringTest {
    info: Container = Container{
        struc: NestedString{ txt: "hello", num: 1 },
        flag: false,
        count: 5,
    };

    init() {
        self.info = Container{
            struc: NestedString{ txt: "world", num: 2 },
            flag: true,
            count: 10,
        };
    }
}
