struct OptionalDeepNested {
    inner: Inner?;
}
struct Inner {
    deep: Deeper?;
}
struct Deeper {
    val: Int?;
}

contract TestContract {
    data: OptionalDeepNested;
    init() {
        self.data = OptionalDeepNested{
            inner: Inner{
                deep: null
            }
        };
    }
}