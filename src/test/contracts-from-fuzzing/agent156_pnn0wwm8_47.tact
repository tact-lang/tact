struct SOptBool {
    flag: Bool?;
}
contract StructOptBoolNull {
    s : SOptBool;

    init() {
        self.s = SOptBool{ flag: null };
    }
}
