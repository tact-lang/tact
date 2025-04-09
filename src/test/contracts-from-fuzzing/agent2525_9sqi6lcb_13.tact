// Chain of nested optional fields

struct End {
    finalVal: Int;
}

struct Mid {
    next: End?;
}

struct Start {
    first: Mid?;
}

contract TestContract {
    deepOpt: Start;

    init() {
        self.deepOpt = Start{
            first: null
        };
    }
}