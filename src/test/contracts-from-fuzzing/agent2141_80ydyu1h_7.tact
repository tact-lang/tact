struct HighlyNested {
    first: Int;
    second: String;
    next: InnerLevel?;
}

struct InnerLevel {
    flag: Bool;
    again: MoreInner?;
}

struct MoreInner {
    val: Int;
    text: String?;
}

contract TestContract {
    d: HighlyNested;

    init() {
        self.d = HighlyNested{
            first: 1,
            second: "hi",
            next: InnerLevel{
                flag: false,
                again: MoreInner{
                    val: 42,
                    text: null
                }
            }
        };
    }
}