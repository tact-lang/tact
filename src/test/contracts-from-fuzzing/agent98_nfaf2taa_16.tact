struct MixTypes {
    i: Int; 
    b: Bool; 
    s: String; 
    addr: Address; 
    cl: Cell; 
    sl: Slice; 
    o: Int?; 
    ob: Bool?; 
}

contract MixedTypeContract {
    state: MixTypes;
    init() {
        self.state = MixTypes{
            i: 1, b: true, s: "xyz", addr: myAddress(), cl: emptyCell(), sl: emptyCell().asSlice(), o: null, ob: false
        };
    }
}