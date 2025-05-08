struct Combo {
    i: Int; 
    b: Bool; 
    s: String;
}

contract OptionalField {
    val: Combo?;

    init() {
        self.val = null;
    }
}