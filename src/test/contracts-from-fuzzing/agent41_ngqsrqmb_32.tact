// Multiple optionals with explicitly assigned non-null nested values
struct InnerOpt {
    s: String?;
    b: Bool?;
}

contract ManyAssignedOptionals {
    data: InnerOpt;
    init() {
        self.data = InnerOpt{
            s: "str",
            b: true,
        };
    }
}