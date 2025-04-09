struct Str1 { s: String }
struct Str2 { s: String }

contract OptStructs {
    x: Str1?;
    y: Str2?;

    init() {
        self.x = null;
        self.y = null;
    }
}