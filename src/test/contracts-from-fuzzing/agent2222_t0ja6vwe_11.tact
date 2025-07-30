struct Small {
    a: Int;
}

struct Bigger {
    one: Small;
    two: Small;
    three: Small;
    four: Small;
    five: Small;
}

contract TestContract {
    data: Bigger;
    init() {
        self.data = Bigger{
            one: Small{a:1}, two:Small{a:2}, three:Small{a:3}, four:Small{a:4}, five:Small{a:5}
        };
    }
}