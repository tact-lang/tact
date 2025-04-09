struct Mixed {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: String?;
}

contract MixedDefaults {
    mix: Mixed = Mixed{ b: null, d: null };
}