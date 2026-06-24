struct DeepInner {
    score: Int as uint8;
    title: String?; 
}

struct MidInner {
    dep: DeepInner?;
}

struct RootStruct {
    m: MidInner?;
    done: Bool;
}

contract DeepNestOpts {
    myData: RootStruct = RootStruct {
        m: null,
        done: false
    };

    init() {}
}