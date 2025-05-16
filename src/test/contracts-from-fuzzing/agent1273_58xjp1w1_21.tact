struct Mix {
    a: Int = 1;
    b: Bool?;
    c: String = "abc";
}

contract MixedDefaultsAndOptionals {
    x: Mix;

    init() {
        self.x = Mix{b:null};
    }
}