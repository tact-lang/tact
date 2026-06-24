struct BigOptLayer1 { a: Int?; b: Bool?; }
struct BigOptLayer2 { x: BigOptLayer1?; }
struct BigOptLayer3 { y: BigOptLayer2?; }
struct BigOptLayer4 { z: BigOptLayer3?; }

contract BigOptionalNest {
    data: BigOptLayer4 = BigOptLayer4{ z: null };
}