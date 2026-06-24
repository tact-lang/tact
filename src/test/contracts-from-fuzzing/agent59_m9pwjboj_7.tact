struct Params {
    flag: Bool;
    count: Int;
    optionalField: Int?;
    mapField: map<Int, Int>;
}

contract DiverseFields {
    params: Params;

    init() {
        self.params = Params{
            flag: true,
            count: 100,
            optionalField: null,
            mapField: emptyMap()
        };
    }
}