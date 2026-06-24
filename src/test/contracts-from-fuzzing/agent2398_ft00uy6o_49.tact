struct BuilderOptStruct {
    b: Builder?;
}

contract TestContract {
    x: BuilderOptStruct;

    init() {
        self.x = BuilderOptStruct{ b: null };
    }
}