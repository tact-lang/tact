// test persistent state with massive nested struct + optionals + defaults
struct Leaf { x: Int?=null; y: Bool?=null; }
struct Mid { leaf: Leaf?=null; }
struct Top { mid: Mid?=null; }

contract MassiveNested {
 t: Top?=null;
 init() {}
}