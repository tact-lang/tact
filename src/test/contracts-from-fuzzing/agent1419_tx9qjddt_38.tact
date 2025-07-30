struct IntBoolStr {
    a: Int;
    b: Bool;
    c: String;
}
struct WrapStruct {
    inner: IntBoolStr;
    num: Int;
}
contract WrapStructTest {
    d: WrapStruct;
    init() {
        self.d = WrapStruct{
            inner: IntBoolStr{a:5, b:true, c:"x"},
            num: 99
        };
    }
}