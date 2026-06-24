struct Inner {
    count: Int as uint16;
    flag: Bool;
    desc: String;
    data: Cell;
}

struct Outer {
    inner: Inner;
    status: Int as int8;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            inner: Inner{
                count: 300,
                flag: true,
                desc: "desc",
                data: emptyCell()
            },
            status: -5
        };
    }
}
