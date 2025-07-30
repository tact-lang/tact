struct SEmptyOptional {
    val: Int?;
}

contract OptionalInit {
    s: SEmptyOptional?;
    
    init() {
        self.s = null;
    }
}