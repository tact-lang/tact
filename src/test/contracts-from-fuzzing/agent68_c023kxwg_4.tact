struct OptionalMapValue {
    level3: map<Int, Int>; // no nested optional value
}

contract OptMapValTest {
    state: OptionalMapValue;

    init() {
        self.state = OptionalMapValue{
            level3: emptyMap(),
        };
    }
}