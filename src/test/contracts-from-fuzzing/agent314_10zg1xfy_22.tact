// contract with only nested optional struct
struct OnlyOptional {
    x: Int?;
}

contract JustOptional {
    val: OnlyOptional?;
    init() {
        self.val = null;
    }
}