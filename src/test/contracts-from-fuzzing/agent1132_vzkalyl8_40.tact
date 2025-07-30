struct Rec {
    prev: Int?;
    payload: String;
}
contract RecOpt {
    item: Rec = Rec{prev: null, payload: "start"};
    
    init() {
        self.item = Rec{prev: 1, payload: "next"};
    }
}