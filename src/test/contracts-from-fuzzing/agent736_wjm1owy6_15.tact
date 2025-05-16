struct RecOuter {
    inner: RecInner?;
}

struct RecInner {
    name: String;
    flag: Bool;
}

contract TestContract {
    ro: RecOuter = RecOuter{inner: null};

    init() {
        self.ro = RecOuter{inner: null};
    }

    receive() {
        dump(self.ro.inner == null);
    }
}