struct OptStruct {
    x: Int?;
}

contract TopLevelOpt {
    content: OptStruct?;

    init() {
        self.content = null;
    }
}
