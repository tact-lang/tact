struct Container {
    inner: String;
}

contract StringInStructDefault {
    data: Container = Container{ inner: "Hello" };

    init() {
        self.data = Container{ inner: "World" };
    }

    receive() {
        let d = self.data;
    }
}