struct Inu {
    cuteness: Int;
    name: String;
}

struct Feline {
    agility: Int;
    mood: String;
}

contract UnionLike {
    caseDog: Inu?;
    caseCat: Feline?;

    init() {
        self.caseDog = Inu{cuteness:10, name:"Shiba"};
        self.caseCat = null;
    }
}