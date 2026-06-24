struct S { s1: String; s2: String; s3: String; s4: String; }

contract ManyStrings {
    d: S;
    init() { self.d = S{ s1: "a", s2: "b", s3: "c", s4: "d" }; }
}