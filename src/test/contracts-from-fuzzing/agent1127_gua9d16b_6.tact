struct OptionalStruct { inner: Inner? }
struct Inner { val: Int; flag: Bool }

contract OptionalInside {
    rec: OptionalStruct;

    init() {
        self.rec = OptionalStruct{
            inner: Inner{ val: 9, flag: true }
        };
    }
}