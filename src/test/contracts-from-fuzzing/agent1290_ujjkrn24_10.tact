contract BuilderOptionals {
    reqBuilder: Builder;
    optBuilder: Builder?;

    init() {
        self.reqBuilder = beginCell();
        self.optBuilder = null;
    }
}