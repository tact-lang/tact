// Contract with nested struct with mix of defaults, options, and nested struct
struct Level2 {
    x: Int?;
    y: Bool;
}

struct Level1 {
    p: Int = 999;
    q: String?;
    inner: Level2;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            p: 111,
            q: "test",
            inner: Level2 {
                x: null,
                y: true
            }
        };
    }
}