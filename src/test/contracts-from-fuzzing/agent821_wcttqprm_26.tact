// test builder inside struct persistence
struct BuilderHolder {
    b: Builder;
}

contract TestStructWithBuilder {
    data: BuilderHolder;

    init() {
        self.data = BuilderHolder{
            b: beginCell().storeUint(1, 1)
        };
    }
}
