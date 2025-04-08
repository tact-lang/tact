contract OptionalBurger {
    pickles: Bool?;
    cheese: Bool?;
    bacon: Bool?;
    sauce: String?;

    init() {
        self.pickles = true;
        self.cheese = null;
        self.bacon = null;
        self.sauce = "secret";
    }
}