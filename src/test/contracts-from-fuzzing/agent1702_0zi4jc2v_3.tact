struct Level2 { x: Int; y: Bool }

struct Level1 { inner: Level2; label: String }

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{
                x: 7,
                y: false,
            },
            label: "deep",
        };
    }
}