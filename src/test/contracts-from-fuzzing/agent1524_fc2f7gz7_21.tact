// struct with serialization types inside contract parameter
struct SerS {
    f1: Int as uint8;
    f2: Int as int64;
}

contract ParamStruct(
    param: SerS,
) {
    receive() {
        let _ = self.param.f1 + 1;
    }
}