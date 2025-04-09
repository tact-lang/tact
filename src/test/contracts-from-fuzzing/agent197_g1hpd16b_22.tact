struct SInner { val: Int = 1; }
struct SMid { val: Int = 2; inner: SInner = SInner{ val: 1 }; }
struct STop { val: Int = 3; mid: SMid = SMid{ val: 2, inner: SInner{ val: 1 } }; }

contract Shadowing {
    s: STop = STop{ val: 3, mid: SMid{ val: 2, inner: SInner{ val:1 } } };
}