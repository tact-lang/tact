struct Inner {
    v: Int = 7;
}

contract TestContract {
    optInner: Inner?;
    init() {
        // no explicit assignment; implicit null
    }
}