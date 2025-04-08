// check optional field inside struct with default omitted
struct HasOpt {
    x: Int?;
}
contract ParseOptStruct {
    f: HasOpt;

    init() {
        self.f = HasOpt{};
    }
}