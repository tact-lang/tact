// large flattened struct used as contract param
struct Huge {
    f01:Int;f02:Int;f03:Int;f04:Int;f05:Int;
    f06:Int;f07:Int;f08:Int;f09:Int;f10:Int;
    f11:Int;f12:Int;f13:Int;f14:Int;f15:Int;
    f16:Int;f17:Int;f18:Int;f19:Int;f20:Int;
    f21:Int;f22:Int;f23:Int;f24:Int;f25:Int;
    f26:Int;f27:Int;f28:Int;f29:Int;f30:Int;
    f31:Int;f32:Int;f33:Int;f34:Int;f35:Int;
    f36:Int;f37:Int;f38:Int;f39:Int;f40:Int;
}

contract Test(
    data: Huge
) {}