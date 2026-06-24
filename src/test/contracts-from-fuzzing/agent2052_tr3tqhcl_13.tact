struct MultiLevel {
    a: Int;
    b: L2;
}

struct L2 {
    c: Bool;
    d: L3;
}

struct L3 {
    e: String;
    f: Bool?;
}

contract MultiLevelTest {
    val: MultiLevel;

    init() {
        self.val = MultiLevel{
            a: 7,
            b: L2{
                c: true,
                d: L3{
                    e: "hi",
                    f: false
                }
            }
        };
    }
}