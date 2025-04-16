struct OptionalOuter {
    inner: OptionalInner?;
}

struct OptionalInner {
    num: Int;
    flag: Bool?;
}

contract TestContract {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter{
            inner: OptionalInner{
                num:123,
                flag:true
            }
        };
    }
}