struct Deep {
    a: Int;
}

struct MidOpt {
    deep: Deep?;
}

struct Upper {
    ref: MidOpt;
}

contract TestContract {
    store: Upper;
    init() {
        self.store = Upper{
            ref: MidOpt{ deep:null }
        };
    }
}