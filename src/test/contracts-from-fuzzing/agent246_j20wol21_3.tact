struct DeepNested {
    point: Coord;
}

struct Coord {
    x: Int;
    y: Int;
    note: Note;
}

struct Note {
    text: String;
    important: Bool;
}

contract ComplexStorage {
    d: DeepNested;

    init() {
        self.d = DeepNested{
            point: Coord{
                x: 1,
                y: 2,
                note: Note{
                    text: "hi",
                    important: true,
                },
            }
        };
    }
}
