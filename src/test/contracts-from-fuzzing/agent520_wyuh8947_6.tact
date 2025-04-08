struct Inner {
    val: Int;
    text: String?;
}
struct Outer {
    nestedOpt: Inner?;
    flag: Bool;
}
contract OptionalInnerStruct {
    data: Outer;

    init() {
        self.data = Outer{
            nestedOpt: null,
            flag: true
        };
    }
}