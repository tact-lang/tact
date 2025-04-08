struct MostlyOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int;
}

contract DefaultsNull {
    val: MostlyOpt;

    init() {
        self.val = MostlyOpt{
            e: 999
        };
    }

    receive() {}
}