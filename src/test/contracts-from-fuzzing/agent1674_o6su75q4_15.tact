message(5) Alert {
    level: Int;
}

struct Info {
    description: String;
    alert: Alert?;
}

struct ComplexOptional {
    count: Int?;
    details: Info?;
    memo: Alert?;
}

contract MixedNestedOptionals {
    state: ComplexOptional;

    init() {
        self.state = ComplexOptional{
            count: null,
            details: null,
            memo: null,
        };
    }
}