struct SInner { innerVal: Int?; }
struct SMid { middle: SInner; }
struct STop { optMid: SMid?; }

contract OptDeep {
    storage: STop;

    init() {
        self.storage = STop{
            optMid: null,
        };
    }
}