struct WithMap {
    numbers: map<Int, Int>
}

contract StructMap {
    data: WithMap;

    init() {
        self.data = WithMap { numbers: emptyMap() };
    }
}