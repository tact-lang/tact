struct Inner {
    A: Int = 1;
    B: String? = null;
}

struct Outer {
    inr: Inner;
    flag: Bool?;
}

contract TestContract {
    o: Outer = Outer{
        inr: Inner{
            A: 42,
            B: null,
        },
        flag: null,
    };

    init() {}
}