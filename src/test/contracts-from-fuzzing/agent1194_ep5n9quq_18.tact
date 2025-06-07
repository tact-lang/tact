struct SDefaultOpt {
    x: Int?;
    y: Bool = true;
    z: String?;
}

contract StructDefaultOptional {
    val: SDefaultOpt;

    init() {
        self.val = SDefaultOpt{ x: null, z: null };
    }
}