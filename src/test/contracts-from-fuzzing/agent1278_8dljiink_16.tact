struct Inner {
    val: Int;
    rem: Cell as remaining;
}

struct Outer {
    id: Int;
    payload: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        let c = emptyCell();
        self.data = Outer{
            id: 1,
            payload: Inner{
                val: 42,
                rem: c,
            },
        };
    }
}