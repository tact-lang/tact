struct Inner {
    flag: Bool = true;
    note: String?;
}

struct Outer {
    inner: Inner;
    label: String = "default label";
}

contract MixDefaultsOptionals {
    store: Outer;

    init() {
        self.store = Outer{
            inner: Inner{
                note: null
            }
        };
    }
}