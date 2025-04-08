struct TVMOptionals {
    c: Cell?;
    s: Slice?;
    val: Int?;
    text: String?;
}

contract TestContract {
    data: TVMOptionals;

    init() {
        self.data = TVMOptionals{
            c: null,
            s: null,
            val: null,
            text: null,
        };
    }
}
