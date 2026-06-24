struct OptionalInner { val: Int?; }

struct Middle { inner: OptionalInner; flag: Bool; }

contract TestContract {
    middle: Middle;

    init() {
        self.middle = Middle{
            inner: OptionalInner{ val: null },
            flag: true
        };
    }
}