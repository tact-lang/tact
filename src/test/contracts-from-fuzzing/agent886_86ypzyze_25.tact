struct Stuff {
    id: Int;
    name: String?;
    active: Bool;
}

contract TestContract {
    optStuff: Stuff?;

    init() {
        self.optStuff = Stuff{
            id: 3,
            name: null,
            active: true
        };
    }
}