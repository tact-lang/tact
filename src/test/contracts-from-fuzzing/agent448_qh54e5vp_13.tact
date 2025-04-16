struct Rec1 { next: Rec2?; x: Int; }
struct Rec2 { next: Rec3?; y: String; }
struct Rec3 { z: Bool; }

contract RecursiveOptionalFields {
    field: Rec1;

    init() {
        self.field = Rec1{ next: Rec2{ next: Rec3{ z: true }, y: "y" }, x: 1 };
    }
}