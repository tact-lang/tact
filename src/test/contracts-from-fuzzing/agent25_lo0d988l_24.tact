struct OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    val: OnlyOptionals;

    init() {
        self.val = OnlyOptionals{
            a: null,
            b: null,
            c: null,
        };
    }
}