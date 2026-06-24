struct SDeep {
    level: Int?;
}

struct MDeep {
    sdeep: SDeep?;
}

contract TestContract(
    mdeep: MDeep?,
) {
    receive() {
        let _ = self.mdeep;
    }
}