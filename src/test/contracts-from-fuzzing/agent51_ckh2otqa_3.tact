struct Bar {
    mapField: map<Int, Int>;
}

contract Test {
    data: Bar;
    init() {
        self.data = Bar{
            mapField: emptyMap()
        };
    }
}