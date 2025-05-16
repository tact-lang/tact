contract Test {
    builderOpt: Builder?;

    init() {
        self.builderOpt = null;
    }

    receive() {
        self.builderOpt = null;
    }
}
