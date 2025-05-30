struct Base {
    val: Int;
}

struct WithOptionals {
    a: Base?;
    b: Int;
    c: String?;
}

contract TestContract {
    data: WithOptionals;

    init() {
        self.data = WithOptionals{
            a: null,
            b: 12,
            c: null
        };
    }

    receive() {}
}