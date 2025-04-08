struct Coord { x: Int; y: Int; }
struct Name { first: String; last: String; }

contract TestContract {
    position: Coord;
    target: Coord;
    username: Name;

    init() {
        self.position = Coord{ x: 1, y: 2 };
        self.target = Coord{ x: 3, y: 4 };
        self.username = Name{ first: "Alice", last: "Smith" };
    }
}