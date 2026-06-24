struct Sub {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Main {
    first: Sub?;
    second: Sub?;
}

contract Nesting {
    data: Main = Main{ first: null, second: null };

    init() {
        self.data = Main{
            first: Sub{ x: 1, y: true, z: "hi" },
            second: null
        };
    }

    receive() {}
}