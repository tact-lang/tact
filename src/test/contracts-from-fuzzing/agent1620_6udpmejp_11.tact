struct MultiType {
    i: Int;
    b: Bool;
    s: String;
    o: Bool?;
    t: String?;
}

contract DiverseTypes {
    data: MultiType;

    init() {
        self.data = MultiType{
            i: 5,
            b: true,
            s: "gg",
            o: false,
            t: null,
        };
    }
}