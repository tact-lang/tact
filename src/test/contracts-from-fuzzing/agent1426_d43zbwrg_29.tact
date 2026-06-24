struct SInner {
    a: Int;
    b: Bool;
}

struct OuterOpt {
    s: SInner?;
    flag: Bool;
}

contract StorageOptStruct {
    persisted: OuterOpt;

    init() {
        self.persisted = OuterOpt{
            s: null,
            flag: true
        };
    }
}