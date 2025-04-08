struct SChunk1 { a1:Int; a2:Int; a3:Int; a4:Int; }
struct SChunk2 { b1:Int; b2:Int; b3:Int; b4:Int; }
contract ChunkedStructs {
    first: SChunk1;
    second: SChunk2;

    init() {
        self.first = SChunk1{ a1:1,a2:2,a3:3,a4:4 };
        self.second = SChunk2{ b1:5,b2:6,b3:7,b4:8 };
    }
}