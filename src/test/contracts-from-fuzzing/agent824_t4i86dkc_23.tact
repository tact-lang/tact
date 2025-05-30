struct InnerDeep {
    intVal: Int as uint4;
    txt: String?;
    addr: Address?;
}

struct MidOpt {
    inner: InnerDeep?;
}

contract TestContract {
    stuff: MidOpt?;

    init() {
        self.stuff = MidOpt{
            inner: InnerDeep{
                intVal: 7,
                txt: null,
                addr: null,
            }
        };
    }
}