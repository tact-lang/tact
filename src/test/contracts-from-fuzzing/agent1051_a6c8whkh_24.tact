struct SubContainer {
    one: Int?;
    two: String;
}

struct TopContainer {
    sub1: SubContainer;
    sub2: SubContainer;
    flag: Bool;
}

contract TestContract {
    data: TopContainer;
    init() {
        self.data = TopContainer{
            sub1: SubContainer{one: null, two: "hello"},
            sub2: SubContainer{one: 5, two: "world"},
            flag: false
        };
    }
}