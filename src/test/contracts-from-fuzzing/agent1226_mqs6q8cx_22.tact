struct List {
    item1: Int;
    item2: Int?;
    item3: String;
    item4: String?;
}

contract Mixed {
    val: List;

    init() {
        self.val = List{
            item1: 1,
            item2: null,
            item3: "foo",
            item4: null
        };
    }
}