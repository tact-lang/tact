struct Inner {
    deepInt: Int;
    deepBool: Bool;
}

struct Middle {
    middleInt: Int;
    inner: Inner;
}

contract TestContract {
    storageInt: Int;
    middle: Middle;
    init() {
        self.storageInt = 7;
        self.middle = Middle {
            middleInt: 8,
            inner: Inner { deepInt: 9, deepBool: false }
        };
    }
}