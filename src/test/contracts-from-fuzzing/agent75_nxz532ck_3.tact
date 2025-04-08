struct Level1 { value: Int }

struct Level2 { inner: Level1? }

struct Level3 { wrapper: Level2 }

contract Test {
    data: Level3?;

    init() {
        self.data = null;
    }
}