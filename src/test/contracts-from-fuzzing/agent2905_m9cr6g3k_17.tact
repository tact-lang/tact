struct Inner1 { a: Int; b: Bool; }
struct Inner2 { s: String; }

contract DiverseStructFields {
    x: Inner1;
    y: Inner2;

    init() {
        self.x = Inner1{ a:1, b:true };
        self.y = Inner2{ s:"hello" };
    }
}