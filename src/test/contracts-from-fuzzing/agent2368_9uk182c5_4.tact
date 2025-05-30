struct Tiny {
    b: Bool;
}

contract ArrayLike {
    first: Tiny;
    second: Tiny;
    third: Tiny;
    fourth: Tiny;
    fifth: Tiny;
    sixth: Tiny;
    
    init() {
        self.first = Tiny{ b: true };
        self.second = Tiny{ b: false };
        self.third = Tiny{ b: true };
        self.fourth = Tiny{ b: false };
        self.fifth = Tiny{ b: true };
        self.sixth = Tiny{ b: false };
    }
}