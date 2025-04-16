struct Nillable {
    x: Int?;
    y: String?;
}

contract OptionalStructAssignment {
    item: Nillable;
    init() {
        self.item = Nillable{ x:null, y:null };
    }
}