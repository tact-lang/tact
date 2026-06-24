struct NestedOpt {
    x: Int?;
    y: Bool?;
}

struct ContainingOpt {
    nopt: NestedOpt;
    text: String;
    active: Bool;
}

contract NestedOptionalTest {
    data: ContainingOpt;

    init() {
        self.data = ContainingOpt{
            nopt: NestedOpt{
                x: null,
                y: null,
            },
            text: "init",
            active: true,
        };
    }

    receive() {
        if (self.data.nopt.x == null) {
            self.data.nopt.x = 10;
        } else {
            self.data.nopt.x = self.data.nopt.x!! + 5;
        }
    }
}