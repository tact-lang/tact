struct Chicken {
    species: String;
    wings: Bool;
}

contract BirdFarm {
    c: Chicken = Chicken{
        species: "Brahma",
        wings: true
    };
}
