struct StructWithBuilder {
    b: Builder;
    bOpt: Builder?;
}

contract BuilderContract {
    rec: StructWithBuilder;

    init() {
        self.rec = StructWithBuilder{ b: beginCell(), bOpt: null };
    }
}