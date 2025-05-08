struct ParamSer {
    id: Int as uint64;
    val: Int as int16;
}

contract TestContract {
    param: ParamSer;

    init() {
        self.param = ParamSer{
            id: 100,
            val: -123
        };
    }
}