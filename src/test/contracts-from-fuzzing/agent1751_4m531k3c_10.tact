struct InnerOpt {
    x: Int;
}

struct MidOpt {
    inner: InnerOpt?;
}

contract OptOptPersist {
    field: MidOpt?;

    receive() {
        self.field = MidOpt{
            inner: InnerOpt{
                x: 7
            }
        };
    }
}