struct XWrap { val: Int }
struct YWrap { val: Bool }
struct ZWrap { val: String }

contract AllStructMix {
    x: XWrap;
    y: YWrap;
    z: ZWrap;

    init() {
        self.x = XWrap{ val:1 };
        self.y = YWrap{ val:true };
        self.z = ZWrap{ val:"str" };
    }
}