struct LeadingOptionals {
    o1: Int?;
    o2: Bool?;
    rest: String;
}

contract TestContract {
    data: LeadingOptionals;

    init() {
        self.data = LeadingOptionals{
            o1: null,
            o2: true,
            rest: "rest"
        };
    }
}