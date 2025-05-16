struct OptSer {
    signedOpt: Int? as int16;
}

contract TestContract {
    data: OptSer;

    init() {
        self.data = OptSer{
            signedOpt: null,
        };
    }
}