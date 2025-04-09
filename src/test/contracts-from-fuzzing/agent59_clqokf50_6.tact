struct Data { x: Int }

contract TestFieldAccessFixed {
    data: Data;

    init() {
        self.data = Data { x: 42 };
    }

    receive() {
        let y: Int = self.data.x;
    }
}
