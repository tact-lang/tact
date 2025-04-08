struct List {
    item1: Int;
    item2: Int;
    item3: Int;
    item4: Int;
    item5: Int;
}

struct Wrapper {
    list: List;
    status: Bool;
    name: String;
}

contract NestedMultiple {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            list: List{
                item1:1, item2:2, item3:3, item4:4, item5:5
            },
            status: true,
            name: "wrap",
        };
    }
}