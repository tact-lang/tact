struct WrapOpt {
    inn: Int?;
}

contract StructOptDefault {
    w: WrapOpt? = null;

    init() {
        self.w = null;
    }
}