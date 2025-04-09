struct WrapString {
    s: String;
}

struct WrapBool {
    b: Bool;
}

struct WrapInt {
    i: Int;
}

contract WrapperTest {
    ws: WrapString = WrapString{s:"test"};
    wb: WrapBool = WrapBool{b:true};
    wi: WrapInt = WrapInt{i:5};
}