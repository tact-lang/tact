struct Basic {
    id: Int = 0;
    name: String = "";
}

struct Container {
    data: Basic?;
    flag: Bool = false;
}

contract OptionalNested {
    rec: Container?;

    init() {
        self.rec = Container{
            data: Basic{ id: 123, name: "abc" },
            flag: true
        };
    }

    receive() {
        let _ = self.rec;
    }
}